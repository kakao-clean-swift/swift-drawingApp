import UIKit

protocol DrawDrawingDisplayLogic: AnyObject {
    func displayDraw(viewModel: Drawing.ViewModel)
}

protocol MoveDrawingDisplayLogic: AnyObject {
    func displayMoveDrawing(viewModel: Drawing.MovableViewModel)
}

protocol SelectDrawingDisplayLogic: AnyObject {
    func displaySelectedItem(viewModel: Drawing.SelectableViewModel)
}

protocol SyncDrawingDisplayLogic: AnyObject {
    
}

class DrawingViewController: UIViewController, SyncDrawingDisplayLogic {
    
    @IBOutlet weak var drawingRectButton: UIButton!
    @IBOutlet weak var drawingLineButton: UIButton!
    @IBOutlet weak var syncButton: UIButton!
    @IBOutlet weak var canvasView: CanvasView!
    
    typealias DrawingBusinessLogic = (DrawDrawingBusinessLogic & MoveDrawingBusinessLogic & SelectDrawingBusinessLogic & SyncDrawingBusinessLogic)
    
    var interactor: DrawingBusinessLogic?
    
    static func create(interactor: DrawingBusinessLogic) -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "DrawingViewController") as! DrawingViewController
        viewController.interactor = interactor
        return viewController as! Self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        self.setupCanvasView()
        self.setupMenu()
    }
    
    private func setup() {
        let viewController = self
        let presenter = DrawingPresenter()
        presenter.viewController = viewController
        let interactor = DrawingInteractor(presenter: presenter, canvas: Canvas(items: [], selected: nil))
        viewController.interactor = interactor
    }
    
    private func setupCanvasView() {
        self.canvasView.delegate = self
        
        self.canvasView.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.didTapCanvasView))
        self.canvasView.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func didTapCanvasView(_ gesture: UITapGestureRecognizer) {
        guard self.drawingRectButton.isSelected else { return }
        let rect = Rectangle(width: 100, height: 100)
        self.interactor?.draw(item: rect)
    }
    
    private func setupMenu() {
        self.drawingRectButton.setTitleColor(.black, for: .normal)
        self.drawingRectButton.setTitleColor(.red, for: .selected)
        self.drawingLineButton.setTitleColor(.black, for: .normal)
        self.drawingLineButton.setTitleColor(.red, for: .selected)
        self.syncButton.setTitleColor(.black, for: .normal)
        self.syncButton.setTitleColor(.red, for: .selected)
    }
    
    @IBAction func didDrawingRectButtonTap(_ sender: Any) {
        self.drawingRectButton.isSelected = true
        self.drawingLineButton.isSelected = false
        self.syncButton.isSelected = false
    }
    
    @IBAction func didDrawingLineButtonTap(_ sender: Any) {
        self.drawingRectButton.isSelected = false
        self.drawingLineButton.isSelected = true
        self.syncButton.isSelected = false
    }
    
    @IBAction func didSyncButtonTap(_ sender: Any) {
        self.drawingRectButton.isSelected = false
        self.drawingLineButton.isSelected = false
        self.syncButton.isSelected = true
    }
}

extension DrawingViewController: DrawDrawingDisplayLogic {
    func displayDraw(viewModel: Drawing.ViewModel) {
        guard let rect = viewModel.drawingComponent as? Rectangle else {
            return
        }
        
        if self.canvasView.addRectangleView(with: rect) {
            return
        }
        self.interactor?.draw(item: Rectangle(width: 100, height: 100))
    }
}

extension DrawingViewController: MoveDrawingDisplayLogic {
    func displayMoveDrawing(viewModel: Drawing.MovableViewModel) {
        let movable = viewModel.movable
        self.canvasView.move(movable: movable)
    }
}

extension DrawingViewController: SelectDrawingDisplayLogic {
    func displaySelectedItem(viewModel: Drawing.SelectableViewModel) {
        self.canvasView.select(selectable: viewModel.selctable)
    }
}

extension DrawingViewController: CanvasViewDelegate {
    func didTapRectangleView(uuid: UUID, isSelected: Bool) {
        self.interactor?.select(id: uuid, isSelected: isSelected)
    }
    
    func didPanRectangleView(uuid: UUID, to point: RelativePoint) {
        self.interactor?.move(id: uuid, to: point)
    }
}


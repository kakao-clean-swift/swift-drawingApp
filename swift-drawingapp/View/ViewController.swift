//
//  ViewController.swift
//  swift-drawingapp
//
//  Created by JK on 2022/07/04.
//

import UIKit
import Combine

class ViewController: UIViewController {
    @IBOutlet var drawingCanvas: DrawingImageView!
    @IBOutlet var itemContainerView: UIView!
    @IBOutlet weak var drawingButton: UIButton!

    private var subscriptions = Set<AnyCancellable>()
    let viewModel = DrawingViewModel()
    var items: [ItemDrawable] = [] {
        didSet {
            drawItems()
        }
    }

    var isManualDrawingSelected: Bool = false {
        didSet {
            drawingButtonSelected()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }

    func bindViewModel() {
        viewModel.visibleRect = CGRect(x: 0, y: 0, width: view.bounds.width - 150, height: view.bounds.height - 300)
        viewModel.$drawableItems
            .sink { [weak self] items in
                self?.items = items
            }.store(in: &subscriptions)
    }

    func drawItems() {
        itemContainerView.subviews.forEach({ $0.removeFromSuperview() })
        for item in items {
            if item.fill == true {
                let itemView = SquareView(item: item)
                itemContainerView.addSubview(itemView)
            }

            // TODO : manual drawing도 itemView화 해서 붙이기..
        }
    }

    // MARK: - Actions
    @IBAction func didTapSqureButton(_ sender: Any) {
        isManualDrawingSelected = false
        viewModel.addSquare()
    }

    @IBAction func didTapDrawingButton(_ sender: Any) {
        isManualDrawingSelected = !isManualDrawingSelected
    }

    @IBAction func didTapSyncButton(_ sender: Any) {
    }

    func drawingButtonSelected() {
        if isManualDrawingSelected {
            drawingButton.layer.borderColor = UIColor.systemPurple.cgColor
            drawingButton.layer.borderWidth = 5
        } else {
            drawingButton.layer.borderWidth = 0
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard isManualDrawingSelected else { return }
        let color = viewModel.getManualDrawingColor()
        drawingCanvas.color = color
        drawingCanvas.touchesBegan(touches, with: event)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard isManualDrawingSelected else { return }
        drawingCanvas.touchesMoved(touches, with: event)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard isManualDrawingSelected else { return }
        drawingCanvas.touchesEnded(touches, with: event)
        viewModel.addManualDrawing(color: drawingCanvas.color, points: drawingCanvas.movePoints)
    }
}


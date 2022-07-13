//
//  ViewController.swift
//  swift-drawingapp
//
//  Created by JK on 2022/07/04.
//

import UIKit
import Combine

class ViewController: UIViewController {

    @IBOutlet weak var drawingView: UIView!
    
    private var viewModel: MainViewModel!
    private var cancelBag: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = MainViewModel(syncUsecase: SyncService())
        bindingDrawRectangle()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.setDrawRectangleUsecase(Painter(sizeOfMap: Size(width: Int(drawingView.frame.width), height: Int(drawingView.frame.height))))
    }

    // MARK: IBAction
    
    @IBAction func didTapDrawRectangleButton(_ sender: Any) {
        viewModel.didTapDrawRectangleButton()
    }
    
    @IBAction func didTapDrawLineButton(_ sender: Any) {
    }
    
    @IBAction func didTapSyncButton(_ sender: Any) {
    }
    
    @IBAction func didTapClearButton(_ sender: Any) {
        viewModel.didTapClearButton()

        drawingView.subviews.forEach({
            $0.removeFromSuperview()
        })
    }
}

// MARK: Presentation

extension ViewController {
    func bindingDrawRectangle() {
        viewModel.$rectanglesToDraw.receive(on: DispatchQueue.main).sink{ [weak self] rectangles in
            rectangles.forEach({ rectangle in
                let rectangleView = RectangleView(frame: CGRect(origin: rectangle.origin, size: rectangle.size), viewModel: rectangle)
                self?.drawingView.addSubview(rectangleView)
            })
        }.store(in: &cancelBag)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first, let rectangleView = touch.view as? RectangleView else { return }
        rectangleView.setSelected()
    }
}


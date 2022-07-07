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

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }

    func bindViewModel() {
        viewModel.visibleRect = CGRect(x: 0, y: 0, width: view.bounds.width - 150, height: view.bounds.height - 300)
        
        viewModel.$drawableItems
            .sink { [weak self] items in
                self?.drawItems(items)
            }.store(in: &subscriptions)
        
        viewModel.$isManualDrawingSelected
            .sink { [weak self] selected in
                self?.drawingButton.isSelected = selected
                self?.drawingButtonSelected()
            }.store(in: &subscriptions)
        
        viewModel.manualDrawingEvent
            .sink { [weak self] color in
                self?.drawingCanvas.color = color
            }.store(in: &subscriptions)
    }

    func drawItems(_ items: [ItemDrawable]) {
        itemContainerView.subviews.forEach({ $0.removeFromSuperview() })
        for item in items {
            if item.drawingType == .fill {
                let itemView = SquareView(item: item)
                itemContainerView.addSubview(itemView)
            }
        }
    }

    // MARK: - Actions
    @IBAction func didTapSqureButton(_ sender: Any) {
        viewModel.didTouchSquareButton()
    }

    @IBAction func didTapDrawingButton(_ sender: Any) {
        viewModel.didTouchManualDrawingButton(selected: !drawingButton.isSelected)
    }

    @IBAction func didTapSyncButton(_ sender: Any) {
    }

    func drawingButtonSelected() {
        if drawingButton.isSelected {
            drawingButton.layer.borderColor = UIColor.systemPurple.cgColor
            drawingButton.layer.borderWidth = 5
        } else {
            drawingButton.layer.borderWidth = 0
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard drawingButton.isSelected else { return }
        drawingCanvas.touchesBegan(touches, with: event)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard drawingButton.isSelected else { return }
        drawingCanvas.touchesMoved(touches, with: event)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard drawingButton.isSelected else { return }
        drawingCanvas.touchesEnded(touches, with: event)
        viewModel.didManualDrawing(color: drawingCanvas.color, points: drawingCanvas.movePoints)
    }
}


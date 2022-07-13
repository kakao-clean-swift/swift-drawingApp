//
//  ViewController.swift
//  swift-drawingapp
//
//  Created by JK on 2022/07/04.
//

import UIKit
import Combine

enum ButtonType {
    case manual
    case square
    case sync
}

class ViewController: UIViewController {
    @IBOutlet var drawingCanvas: DrawingImageView!
    @IBOutlet var itemContainerView: UIView!
    @IBOutlet weak var drawingSquareButton: UIButton!
    @IBOutlet weak var drawingManualButton: UIButton!  
    @IBOutlet weak var drawingSyncButton: UIButton!

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
        
        viewModel.startDrawingEvent
            .sink { [weak self] item in                
                if item.drawingType == .line {
                    self?.updateButtons(type: .manual, selected: true)
                    self?.drawingCanvas.color = item.color                     
                } else {
                    self?.updateButtons(type: .square, selected: true)
                }              
            }.store(in: &subscriptions)
        
        viewModel.endDrawingEvent
            .sink { [weak self] item in
                self?.resetStatusForButtons()
            }.store(in: &subscriptions)
        
        viewModel.refreshItems
            .sink { [weak self] items in
                self?.drawItems(items)
            }.store(in: &subscriptions)
    }
     
    private func resetStatusForButtons() {
        drawingManualButton.isSelected = false        
        drawingSquareButton.isSelected = false
        drawingSyncButton.isSelected = false
        
        drawingManualButton.layer.borderWidth = 0
        drawingSquareButton.layer.borderWidth = 0
        drawingSyncButton.layer.borderWidth = 0        
    }                            
    
    func updateButtons(type: ButtonType, selected: Bool) {       
        resetStatusForButtons()
        
        var selectedButton: UIButton?        
        if type == .manual {
            selectedButton = drawingManualButton
        } else if type == .square {
            selectedButton = drawingSquareButton
        } else {
            selectedButton = drawingSyncButton
        }
        
        if let selectedButton = selectedButton {
            selectedButton.isSelected = true
            selectedButton.layer.borderColor = UIColor.systemPurple.cgColor
            selectedButton.layer.borderWidth = 5
        }
    }

    func drawItems(_ items: [ItemDrawable]) {
        itemContainerView.subviews.forEach({ $0.removeFromSuperview() })
        for item in items {
            if item.drawingType == .fill {
                let itemView = SquareView(item: item)
                itemView.didTap = { [weak self] item in
                    self?.viewModel.didSelectItem(item)
                }
                itemContainerView.addSubview(itemView)
            }
        }
    }

    // MARK: - Actions
    @IBAction func didTapSqureButton(_ sender: Any) {
        viewModel.didTapSquareButton()
    }

    @IBAction func didTapDrawingButton(_ sender: Any) {
        viewModel.didTapManualDrawingButton()
    }

    @IBAction func didTapSyncButton(_ sender: Any) {
        viewModel.didTapSyncButton()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard drawingManualButton.isSelected else { return }
        drawingCanvas.touchesBegan(touches, with: event)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard drawingManualButton.isSelected else { return }
        drawingCanvas.touchesMoved(touches, with: event)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard drawingManualButton.isSelected else { return }
        drawingCanvas.touchesEnded(touches, with: event)
        viewModel.didEndManualDrawing(color: drawingCanvas.color, points: drawingCanvas.movePoints)
    }
}


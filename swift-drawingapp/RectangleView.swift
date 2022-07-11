//
//  RectangleView.swift
//  swift-drawingapp
//
//  Created by 윤준수 on 2022/07/11.
//

import UIKit
import Combine

class RectangleView: UIView {
    private var viewModel: RectangleViewModel
    private var isSelected: Bool = false {
        didSet{
            if isSelected {
                layer.borderWidth = 2
            } else {
                layer.borderWidth = 0
            }
        }
    }
    
    init(frame: CGRect, viewModel: RectangleViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        
        layer.borderColor = UIColor.systemRed.cgColor
        backgroundColor = viewModel.color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setSelected() {
        guard viewModel.isSelectable else { return }
        isSelected.toggle()
    }
}

//
//  SquareView.swift
//  swift-drawingapp
//
//  Created by fran on 2022/07/04.
//

import UIKit

/**
 DrawItemView
 */

class SquareView: UIButton {
    var item: ItemDrawable    
    public var didTap: ((_ item: ItemDrawable) -> Void)?
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.layer.borderColor = UIColor.systemRed.cgColor
                self.layer.borderWidth = 5
            } else {
                self.layer.borderWidth = 0
            }
        }
    }

    init(item: ItemDrawable) {
        self.item = item
        super.init(frame: .zero)
        
        self.isSelected = item.isSelected
        self.addTarget(self, action: #selector(didSelect), for: .touchUpInside)

        drawItem()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func drawItem() {
        self.frame = getFrame()

        if item.drawingType == .fill {
            self.backgroundColor = item.color
        }
    }
    
    @objc
    private func didSelect() {
        self.didTap?(item)
    }

    private func getFrame() -> CGRect {
        let xArray = item.points.map(\.x)
        let yArray = item.points.map(\.y)
        guard let minX = xArray.min(),
              let maxX = xArray.max(),
              let minY = yArray.min(),
              let maxY = yArray.max() else { return CGRect.zero }

        return CGRect(x: CGFloat(minX), y: CGFloat(minY), width: CGFloat(maxX - minX), height: CGFloat(maxY - minY))
    }
}


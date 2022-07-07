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

class SquareView: UIImageView {
    var item: ItemDrawable

    init(item: ItemDrawable) {
        self.item = item
        super.init(frame: .zero)

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

    private func getFrame() -> CGRect {
        let xArray = item.points.map(\.x)
        let yArray = item.points.map(\.y)
        guard let minX = xArray.min(),
              let maxX = xArray.max(),
              let minY = yArray.min(),
              let maxY = yArray.max() else { return CGRect.zero }

        return CGRect(x: minX, y: minY, width: maxX - minX, height: maxY - minY)
    }
}


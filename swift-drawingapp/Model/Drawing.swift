//
//  Drawing.swift
//  swift-drawingapp
//
//  Created by Hailey on 2022/07/05.
//

import CoreGraphics
import UIKit

struct Drawing {
    var id: String = ""
    var image: UIImage?
    var coordinates: [CGPoint] = []
    var rect: CGRect {
        return createRect()
    }

    private func createRect() -> CGRect {
        let x = coordinates.map { $0.x }
        let y = coordinates.map { $0.y }

        let minX = x.min() ?? 0
        let maxX = x.max() ?? 0
        let minY = y.min() ?? 0
        let maxY = y.max() ?? 0

        let width = maxX - minX
        let height = maxY - minY
        return CGRect(x: minX, y: minY, width: width, height: height)
    }
}

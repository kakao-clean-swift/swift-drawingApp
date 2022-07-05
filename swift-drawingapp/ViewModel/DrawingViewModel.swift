//
//  DrawingViewModel.swift
//  swift-drawingapp
//
//  Created by fran on 2022/07/04.
//

import UIKit

class DrawingViewModel {
    @Published var drawableItems: [DrawingObject] = []
    var visibleRect: CGRect = .zero

    func addSquare() {
        drawableItems.append(squareObject())
    }

    func addManualDrawing(color: UIColor, points: [CGPoint]) {
        let drawingObject = DrawingObject(type: .manual, color: color)
        drawingObject.points = points
        drawableItems.append(drawingObject)
    }

    func getManualDrawingColor() -> UIColor {
        return randomSystemColor()
    }

    private func squareObject() -> DrawingObject {
        let squareObject = DrawingObject(type: .square, color: randomSystemColor())
        let startPoint = randomPoint()
        let fixedLength = squareObject.fixedLength
        squareObject.points = [startPoint, CGPoint(x: startPoint.x + fixedLength, y: startPoint.y + fixedLength)]

        return squareObject
    }

    private func randomSystemColor() -> UIColor {
        let colors: [UIColor] = [.systemPink, .systemBlue, .systemBlue, .systemCyan, .systemFill, .systemGray, .systemMint, .systemTeal, .systemBrown, .systemGray2, .systemGreen, .systemIndigo, .systemOrange, .systemPurple, .systemYellow]
        return colors.randomElement() ?? .systemGray
    }

    private func randomPoint() -> CGPoint {
        let x = Int(arc4random_uniform(UInt32(visibleRect.width)))
        let y = Int(arc4random_uniform(UInt32(visibleRect.height)))
        return CGPoint(x: x, y: y)
    }
}

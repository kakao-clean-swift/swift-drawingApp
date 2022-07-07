//
//  DrawingViewModel.swift
//  swift-drawingapp
//
//  Created by fran on 2022/07/04.
//

import UIKit
import Combine

class DrawingViewModel {
    @Published var drawableItems: [ItemDrawable] = []
    @Published var isManualDrawingSelected: Bool = false
    
    public let manualDrawingEvent = PassthroughSubject<UIColor, Never>()    
        
    var visibleRect: CGRect = .zero
    
    // input
    func didTouchManualDrawingButton(selected: Bool) {
        isManualDrawingSelected = selected
        startManualDrawing()
    }
    
    func didTouchSquareButton() {
        isManualDrawingSelected = false
        addSquareObject()
    }

    func didManualDrawing(color: UIColor, points: [CGPoint]) {
        addManualDrawing(color: color, points: points)
        isManualDrawingSelected = false
    }
    
    // output    
    func startManualDrawing() {
        manualDrawingEvent.send(randomSystemColor())
    }
    
    private func addSquareObject() {
        let squareObject = DrawingObject(type: .square, color: randomSystemColor())
        let startPoint = randomPoint()
        let fixedLength = squareObject.fixedLength
        squareObject.points = [startPoint, CGPoint(x: startPoint.x + fixedLength, y: startPoint.y + fixedLength)]
        drawableItems.append(squareObject)
    }
    
    private func addManualDrawing(color: UIColor, points: [CGPoint]) {
        let drawingObject = DrawingObject(type: .manual, color: color)
        drawingObject.points = points
        drawableItems.append(drawingObject)
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

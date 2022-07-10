//
//  DrawingScreen.swift
//  swift-drawingapp
//
//  Created by kakao on 2022/07/04.
//

import UIKit

final class DrawingScreen: UIView {
    private var startLineColor: UIColor = .clear
    private var drawingPoints: [CGPoint] = []

    var enableDrawingLine: Bool = false
    var padding: UIEdgeInsets = .zero

    var shapes: [Shape] {
        subviews.compactMap({ ($0 as? ShapeView)?.shape })
    }

    var randomPosition: CGPoint {
        let insetedBounds = bounds.inset(by: padding)
        let randomX = Double.random(in: insetedBounds.minX...insetedBounds.maxX)
        let randomY = Double.random(in: insetedBounds.minY...insetedBounds.maxY)
        return CGPoint(x: randomX, y: randomY)
    }

    func makeShapeView(shape: Shape) -> ShapeView? {
        if let square = shape as? Square {
            return SquareView(square: square, color: UIColor.systemRandomColor)
        } else if let line = shape as? Line {
            return LineView(line: line, color: startLineColor)
        }

        return nil
    }

    func addView(shape: Shape) {
        guard let shapeView = makeShapeView(shape: shape) else { return }

        addSubview(shapeView)
    }

    func drawLine(gesture: UIPanGestureRecognizer) {
        guard enableDrawingLine else { return }

        switch gesture.state {
        case .began:
            drawingPoints.append(gesture.location(in: self))
            startLineColor = UIColor.systemRandomColor
        case .changed:
            let location = gesture.location(in: self)
            gesture.setTranslation(location, in: self)
            drawingPoints.append(location)
            setNeedsDisplay()
        case .ended:
            addView(shape: Line(points: drawingPoints))
            drawingPoints = []
            setNeedsDisplay()
        default:
            print("-")
        }
    }

    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext(), drawingPoints.isEmpty == false else { return }

        context.setLineWidth(LineView.width)
        context.setStrokeColor(startLineColor.cgColor)
        context.move(to: drawingPoints.first!)
        for point in drawingPoints {
            context.addLine(to: point)
        }
        context.strokePath()
    }
}

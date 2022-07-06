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

    var shapes: [Shape] {
        subviews.compactMap({ ($0 as? ShapeView)?.shape })
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        self.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(drawLine(gesture:))))
    }

    func addSquareViewForRandom() {
        let insetedBounds = bounds.inset(by: UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50))
        let randomX = Double.random(in: insetedBounds.minX...insetedBounds.maxX)
        let randomY = Double.random(in: insetedBounds.minY...insetedBounds.maxY)
        let square = Square(center: CGPoint(x: randomX, y: randomY), size: SquareView.size)

        addSquareView(square: square)
    }

    func addSquareView(square: Square) {
        let squareView = SquareView(square: square, color: UIColor.systemRandomColor)

        addSubview(squareView)
    }

    func addLineView(line: Line) {
        let lineView = LineView(line: line, color: startLineColor)

        addSubview(lineView)
    }

    @objc private func drawLine(gesture: UIPanGestureRecognizer) {
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
            addLineView(line: Line(points: drawingPoints))
            drawingPoints = []
            setNeedsDisplay()
        case .cancelled, .failed:
            print("그리기 실패")
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

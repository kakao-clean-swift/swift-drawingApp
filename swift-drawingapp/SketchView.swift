//
//  CanvasView.swift
//  swift-drawingapp
//
//  Created by Hailey on 2022/07/05.
//

import UIKit

protocol SketchAction {
    func sketchView(_ drawingView: SketchView, didBeginDrawingWith point: CGPoint)
    func sketchView(_ drawingView: SketchView, didMoveDrawingTo point: CGPoint)
    func sketchView(_ drawingView: SketchView, didEndDrawingWith image: UIImage?)
}

class SketchView: UIImageView {

    private let lineWidth: CGFloat = 4.0
    private var color: CGColor = UIColor.random.cgColor
    private var lastPoint: CGPoint?

    var action: SketchAction?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let point = touch.location(in: self)
            action?.sketchView(self, didBeginDrawingWith: point)
            lastPoint = point
            color = UIColor.random.cgColor
        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let lastPoint = lastPoint, let touch = touches.first else { return }
        UIGraphicsBeginImageContext(frame.size)
        UIGraphicsGetCurrentContext()?.setStrokeColor(color)
        UIGraphicsGetCurrentContext()?.setLineWidth(lineWidth)

        let currentPoint = touch.location(in: self)
        image?.draw(in: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))

        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: currentPoint.x, y: currentPoint.y))
        UIGraphicsGetCurrentContext()?.strokePath()

        image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        self.lastPoint = currentPoint
        action?.sketchView(self, didMoveDrawingTo: currentPoint)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let lastPoint = lastPoint else { return }

        UIGraphicsBeginImageContext(frame.size)
        UIGraphicsGetCurrentContext()?.setStrokeColor(color)
        UIGraphicsGetCurrentContext()?.setLineWidth(lineWidth)

        let touch = touches.first! as UITouch
        let currentPoint = touch.location(in: self)

        image?.draw(in: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))

        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: currentPoint.x, y: currentPoint.y))
        UIGraphicsGetCurrentContext()?.strokePath()

        image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        action?.sketchView(self, didEndDrawingWith: image)
        image = nil
    }
}

//
//  DrawingImageView.swift
//  swift-drawingapp
//
//  Created by fran on 2022/07/04.
//

import UIKit

/**
 Manual Drawing 이벤트 받아 실시간 그리는 뷰
 */

class DrawingImageView: UIImageView {
    var isMoved: Bool = false
    var lastPoint = CGPoint.zero
    var movePoints: [CGPoint] = []
    var color: UIColor = .systemGray

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func reset() {
        movePoints = []
        lastPoint = .zero
        isMoved = false
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        reset()

        lastPoint = touch.location(in: self)
        movePoints.append(lastPoint)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }

        isMoved = true
        let currentPoint = touch.location(in: self)
        draw(from: lastPoint, to: currentPoint)
        lastPoint = currentPoint
        movePoints.append(lastPoint)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !isMoved {
            draw(from: lastPoint, to: lastPoint)
            movePoints.append(lastPoint)
        }
    }

    func draw(from fromPoint: CGPoint, to toPoint: CGPoint) {
        UIGraphicsBeginImageContext(self.bounds.size)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        self.image?.draw(in: self.bounds)

        context.move(to: fromPoint)
        context.addLine(to: toPoint)
        context.setBlendMode(.normal)
        context.setLineCap(.round)
        context.setLineWidth(10)
        context.setStrokeColor(self.color.cgColor)
        context.strokePath()

        self.image = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()
    }
}

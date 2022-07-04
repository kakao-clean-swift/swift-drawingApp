//
//  LineView.swift
//  swift-drawingapp
//
//  Created by kakao on 2022/07/04.
//

import UIKit

final class LineView: ShapeView {
    static let width: CGFloat = 2
    
    private var color: UIColor!

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    private var origin: CGPoint {
        let minX = (shape as! Line).points.minX - 10
        let minY = (shape as! Line).points.minY - 10
        return CGPoint(x: minX, y: minY)
    }

    private var size: CGSize {
        let maxX = (shape as! Line).points.maxX + 10
        let maxY = (shape as! Line).points.maxY + 10
        return CGSize(width: maxX - origin.x, height: maxY - origin.y)
    }

    convenience init(line: Line, color: UIColor) {
        self.init(frame: .zero)
        self.shape = line
        self.color = color
        self.frame = CGRect(origin: origin, size: size)
        self.backgroundColor = .clear
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        guard let line = shape as? Line, let context = UIGraphicsGetCurrentContext() else { return }

        var points = line.points.compactMap({ CGPoint(x: $0.x - origin.x, y: $0.y - origin.y)})
        context.setLineWidth(LineView.width)
        context.setStrokeColor(color.cgColor)
        context.move(to: points.removeFirst())
        for point in points {
            context.addLine(to: point)
        }
        context.strokePath()
    }
}

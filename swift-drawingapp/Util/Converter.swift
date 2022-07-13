//
//  FloatConverter.swift
//  swift-drawingapp
//
//  Created by Hochang Lee on 2022/07/05.
//

import UIKit

final class Converter {
    static func toUIKit(_ value: Float) -> CGFloat {
        return CGFloat(value)
    }
    
    static func fromUIKit(_ value: CGFloat) -> Float {
        return Float(value)
    }
    
    static func toUIKit(_ point: Point) -> CGPoint {
        return CGPoint(x: toUIKit(point.x), y: toUIKit(point.y))
    }
    
    static func fromUIKit(_ point: CGPoint) -> Point {
        return Point(x: fromUIKit(point.x), y: fromUIKit(point.y))
    }
    
    static func toUIKit(_ size: Size) -> CGSize {
        return CGSize(width: toUIKit(size.width), height: toUIKit(size.height))
    }
    
    static func fromUIKit(_ size: CGSize) -> Size {
        return Size(width: fromUIKit(size.width), height: fromUIKit(size.height))
    }
    
    static func toUIKit(_ rect: Rectangle) -> CGRect {
        return CGRect(origin: toUIKit(rect.origin), size: toUIKit((rect.size)))
    }
    
    static func fromUIKit(_ rect: CGRect) -> Rectangle {
        return Rectangle(origin: fromUIKit(rect.origin), size: fromUIKit(rect.size))
    }
}

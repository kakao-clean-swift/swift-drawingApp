//
//  FloatConverter.swift
//  swift-drawingapp
//
//  Created by Hochang Lee on 2022/07/05.
//

import UIKit

protocol FloatConvertable {
    func toUIKit(_ value: Float) -> CGFloat
    func FromUIKit(_ value: CGFloat) -> Float
}

final class FloatConverter: FloatConvertable {
    func toUIKit(_ value: Float) -> CGFloat {
        return CGFloat(value)
    }
    
    func FromUIKit(_ value: CGFloat) -> Float {
        return Float(value)
    }
    
    
}

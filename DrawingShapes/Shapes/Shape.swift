//
//  Shapes.swift
//  swift-drawingapp
//
//  Created by jaychoi on 2022/07/04.
//

import Foundation
import UIKit

public protocol Shape: Identity, Dimension, Color {}

public protocol Identity {
    var id: UUID { get }
}

public protocol Dimension {
    var frame: CGRect { get set }
}

public protocol Color {
    var stroke: UIColor { get }
}

public protocol ShapeEquatable {
    func isEqual<S>(with shape: S) -> Bool where S: Shape
}


extension ShapeEquatable where Self: Identity {
    public func isEqual<S>(with shape: S) -> Bool where S: Shape {
        guard self is S else {
            return false
        }
        return self.id == shape.id
    }
}

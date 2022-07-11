//
//  Shapes.swift
//  swift-drawingapp
//
//  Created by jaychoi on 2022/07/04.
//

import Foundation
import UIKit

public protocol Shape: Identity, Dimension, Color, Hashable {}

public protocol Identity {
    var id: UUID { get }
}

public protocol Dimension {
    var frame: CGRect { get set }
}

public protocol Color {
    var stroke: UIColor { get }
}

public func == <S: Shape>(lhs: S, rhs: S) -> Bool {
    return type(of: lhs) == type(of: rhs) && lhs.id == rhs.id
}

extension Shape {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

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

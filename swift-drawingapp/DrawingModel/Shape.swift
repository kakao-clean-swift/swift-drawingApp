//
//  Shapes.swift
//  swift-drawingapp
//
//  Created by jaychoi on 2022/07/04.
//

import Foundation
import UIKit

protocol Shape: Identity, Dimension, Color {}

protocol Identity {
    var id: UUID { get }
}

protocol Dimension {
    var frame: CGRect { get set }
}

protocol Color {
    var stroke: UIColor { get }
}

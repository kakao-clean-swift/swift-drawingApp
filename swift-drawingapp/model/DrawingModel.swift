//
//  DrawingModel.swift
//  swift-drawingapp
//
//  Created by kevin.p on 2022/07/04.
//

import Foundation
import UIKit

enum ShapeTypes {
    case Line, Rectangle
}

protocol DrawingModel {
    var id: UUID { get set }
}

class Rectangle: DrawingModel {
    var id: UUID = UUID()
}

class Lines: DrawingModel {
    var id: UUID = UUID()
    
    var lines = [Line]()
}

class Line {
    let storkeWidth: Float = 1.0
    let color: UIColor = UIColor.blue
    var points: [CGPoint] = []
}

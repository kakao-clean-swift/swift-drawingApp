//
//  ItemDrawable.swift
//  swift-drawingapp
//
//  Created by fran on 2022/07/04.
//

import UIKit

protocol ItemDrawable {
    var id: String { get } // unique id
    var drawingType: DrawingType { get }
    var color: UIColor { get }
    var points: [CGPoint] { get }
}

enum DrawingType {
    case fill
    case line
}


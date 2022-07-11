//
//  ItemDrawable.swift
//  swift-drawingapp
//
//  Created by fran on 2022/07/04.
//

import UIKit

/**
 뷰 그리기에 필요한 interface
 */

protocol ItemDrawable {
    var id: String { get } // unique id
    var drawingType: DrawingType { get }
    var color: UIColor { get }
    var points: [Point] { get }
    var isSelected: Bool { get }
}

enum DrawingType {
    case fill
    case line
}

struct Point {
    var x: Float
    var y: Float
    
    static let zero = Point(x:0, y: 0)
}


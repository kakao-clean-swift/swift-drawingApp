//
//  DrawObject.swift
//  swift-drawingapp
//
//  Created by main on 2022/07/06.
//

import Foundation

class DrawObject {
    var color: Color
    var point: Point
    
    init(color: Color, point: Point) {
        self.color = color
        self.point = point
    }
}

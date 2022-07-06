//
//  Point.swift
//  swift-drawingapp
//
//  Created by main on 2022/07/07.
//

import Foundation

final class Point {
    private static let MAX_POINT_X = 800
    private static let MAX_POINT_Y = 800
    
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

extension Point {
    static var random: Point {
        return Point(x: Int.random(in: 0...MAX_POINT_X),
                     y: Int.random(in: 0...MAX_POINT_Y))
    }
}

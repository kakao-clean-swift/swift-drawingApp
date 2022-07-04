//
//  Shape.swift
//  swift-drawingapp
//
//  Created by bean Milky on 2022/07/04.
//

import Foundation

struct Point {
    let x: Double
    let y: Double
}

private protocol Shape {
    var points: [Point] { get set }
}

struct Rectangle: Shape {
    public fileprivate(set) var points: [Point] = []
    
    init(points: [Point]) {
        self.points = points
    }
    
}

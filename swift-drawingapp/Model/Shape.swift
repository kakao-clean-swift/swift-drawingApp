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

protocol Shape {
    var points: [Point] { get set }
    var width: Double { get }
    var height: Double { get }
}

struct Rectangle: Shape {
    public internal(set) var points: [Point] = []
    
    init(points: [Point]) {
        self.points = points
    }
    
    var width: Double {
        return maxX - minX
    }
    
    var height: Double {
        return maxY - minY
    }
    
    private var minX: Double {
        return points.map { $0.x }.min()!
    }
    
    private var minY: Double {
        return points.map { $0.y }.min()!
    }
    
    private var maxX: Double {
        return points.map { $0.x }.max()!
    }
    
    private var maxY: Double {
        return points.map { $0.y }.max()!
    }
}

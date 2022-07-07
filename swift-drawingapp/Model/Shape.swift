//
//  Shape.swift
//  swift-drawingapp
//
//  Created by bean Milky on 2022/07/04.
//

import Foundation

struct Point: Equatable {
    let x: Double
    let y: Double
    
    func distance(from: Point) -> Double {
        return sqrt(pow((x-from.x), 2) + pow((y-from.y), 2))
    }
}

protocol Shape {
    static var countOfPoints: Int { get }
    var points: [Point] { get set }
    var width: Double { get }
    var height: Double { get }
    init(points: [Point])
}

struct Rectangle: Shape, Equatable {
    static func == (lhs: Rectangle, rhs: Rectangle) -> Bool {
        return lhs.points == rhs.points
    }
    
    static var countOfPoints: Int {
        return 4
    }
    
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

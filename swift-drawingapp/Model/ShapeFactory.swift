//
//  RectangleFactory.swift
//  swift-drawingapp
//
//  Created by bean Milky on 2022/07/04.
//

import Foundation

protocol ShapeGeneratable {
    func build<T: Shape>(type: T.Type) -> Shape?
}

struct ShapeRange {
    let minX: Double
    let minY: Double
    let maxX: Double
    let maxY: Double
    
    init(minX: Double = 0,
         minY: Double = 0,
         maxX: Double = 0,
         maxY: Double = 0) {
        self.minX = minX
        self.minY = minY
        self.maxX = maxX
        self.maxY = maxY
    }
    
}

class ShapeFactory: ShapeGeneratable {
    
    let range: ShapeRange
    
    init(range: ShapeRange) {
        self.range = range
    }
    
    func build<T: Shape>(type: T.Type) -> Shape? {
        switch type {
        case is Rectangle.Type:
            return Rectangle.init(points: self.points(count: 4))
        default:
            return nil
        }
    }
    
    private func points(count: Int) -> [Point] {
        return (0..<count).reduce(into: [], { prev, value in
            prev.append(Point(x: Double.random(in: range.minX..<range.maxX),
                              y: Double.random(in: range.minY..<range.maxY)))
        })
    }
}

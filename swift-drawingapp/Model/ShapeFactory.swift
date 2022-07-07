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
    
    let planeRange: ShapeRange
    let shapeRange: ShapeRange
    
    init(planeRange: ShapeRange, shapeRange: ShapeRange) {
        self.shapeRange = shapeRange
        self.planeRange = planeRange
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
        
        let startX = Double.random(in: planeRange.minX..<planeRange.maxX)
        let startY = Double.random(in: planeRange.minY..<planeRange.maxY)
        
        var points: [Point] = []
        for _ in 0...count-1 {
            let x = Double.random(in: shapeRange.minX..<shapeRange.maxX)
            let y = Double.random(in: shapeRange.minY..<shapeRange.maxY)
            let point = Point(x: x, y: y)
            points.append(point)
        }
        
        let standard = points[0]
        
        let rightPoints = points
            .filter { $0.x > standard.x }
            .sorted { $0.distance(from: standard) < $1.distance(from: standard) }
        let leftPoints = points
            .filter { $0.x < standard.x }
            .sorted { $0.distance(from: standard) > $1.distance(from: standard) }
        
        points = [standard]
        points.append(contentsOf: rightPoints)
        points.append(contentsOf: leftPoints)
        points.append(standard)
                
        return points.map { Point(x: startX + $0.x, y: startY + $0.y )}
    }
}

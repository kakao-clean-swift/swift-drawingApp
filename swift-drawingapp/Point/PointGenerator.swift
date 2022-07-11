//
//  PointGenerator.swift
//  swift-drawingapp
//
//  Created by 윤준수 on 2022/07/10.
//

import Foundation

protocol PointGeneratorProtocol {
    var maxPoint: Point { get }
    func getRandomPoint() -> Point
}

struct PointGenerator: PointGeneratorProtocol {
    var maxPoint: Point//가능 영역의 우하단
    func getRandomPoint() -> Point {
        let y = Int.random(in: (0..<maxPoint.y))
        let x = Int.random(in: (0..<maxPoint.x))
        
        return Point(y: y, x: x)
    }
}

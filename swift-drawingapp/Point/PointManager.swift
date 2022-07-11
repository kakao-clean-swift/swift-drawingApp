//
//  PointManager.swift
//  swift-drawingapp
//
//  Created by 윤준수 on 2022/07/10.
//

import Foundation

struct PointManager {
    var generator: any PointGeneratorProtocol
    var verifier: PointVerifier
    
    init(generator: PointGeneratorProtocol, sizeOfMap: Size) {
        self.generator = generator
        
        verifier = PointVerifier(sizeOfMap: sizeOfMap)
    }
    
    func getOrigin(size: Size) -> Point {
        var origin: Point
        repeat {
            origin = generator.getRandomPoint()
        } while !verifier.isAvailablePoint(origin: origin, size: size)
        
        return origin
    }
}

//
//  Figure.swift
//  swift-drawingapp
//
//  Created by joel.inju on 2022/07/04.
//

import Foundation

struct Figure {
    var id: UUID 
    var colorIndex: Int
    var points = [Point]()
    
    init(_ point: Point) {
        self.id = UUID()
        self.colorIndex = Int(arc4random_uniform(9))
        self.points.append(point)
    }
}

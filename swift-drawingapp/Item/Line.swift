//
//  Line.swift
//  swift-drawingapp
//
//  Created by Landon.kim on 2022/07/04.
//

import UIKit

class Line : ItemBase {
    var selected: Bool = false
    
    var id: UUID = UUID()
    
    var mine: Bool
    
    var color: UIColor = ColorFactory.randomColor()
    
    var origin: CGPoint
    
    var points: [CGPoint]
    
    init(mine: Bool, points: [CGPoint]) {
        self.mine = mine
        self.origin = points.first ?? .zero
        self.points = points
    }
}


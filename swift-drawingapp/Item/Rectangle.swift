//
//  Rectangle.swift
//  swift-drawingapp
//
//  Created by Landon.kim on 2022/07/04.
//

import UIKit

class Rectangle : ItemBase {
    
    var points: [CGPoint]
    
    var selected: Bool = false
    
    var id: UUID = UUID()
    
    var mine: Bool
    
    var color: UIColor = ColorFactory.randomColor()
    
    var origin: CGPoint
    
    var rect: CGRect { CGRect(origin: origin, size: CGSize(width: Self.width, height: Self.height)) }
    
    static let width = 100
    static let height = 100
    
    init(mine: Bool, origin: CGPoint) {
        self.mine = mine
        self.origin = origin
        
        var pts = [CGPoint]()
        pts.append(self.origin)
        pts.append(CGPoint(x: self.origin.x + 100, y: self.origin.y))
        pts.append(CGPoint(x: self.origin.x + 100, y: self.origin.y + 100))
        pts.append(CGPoint(x: self.origin.x , y: self.origin.y + 100))
        pts.append(self.origin)
        
        self.points = pts
    }
}

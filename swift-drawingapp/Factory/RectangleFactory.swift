//
//  RectangleFactory.swift
//  swift-drawingapp
//
//  Created by Landon.kim on 2022/07/04.
//

import UIKit

class RectangleFactory {
    static private let maxX = UIScreen.main.bounds.maxX
    static private let maxY = UIScreen.main.bounds.maxY
    
    static func rectangleMy() -> Rectangle {
        
        let x = Int.random(in: 0...(Int(maxX) - Rectangle.width))
        let y = Int.random(in: 0...(Int(maxY) - Rectangle.height))
        
        return Rectangle(mine: true, origin: CGPoint(x: x, y: y))
    }
}

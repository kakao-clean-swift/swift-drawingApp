//
//  Point.swift
//  swift-drawingapp
//
//  Created by joel.inju on 2022/07/04.
//

import UIKit

struct Point {
    let x: Int
    let y: Int
    
    init() {
        self.x = Int(arc4random_uniform(UInt32(UIScreen.main.bounds.width) - 100))
        self.y = Int(arc4random_uniform(UInt32(UIScreen.main.bounds.height) - 100))
    }
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

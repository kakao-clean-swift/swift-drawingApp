//
//  DrawingModel.swift
//  swift-drawingapp
//
//  Created by jaychoi on 2022/07/04.
//

import Foundation

final class Drawers {
    let screen: Screen
    init(screen: Screen) {
        self.screen = screen
    }
    
    private var shapes: [Shape] = []
    
    var countOfShapes: Int { shapes.count }
    
    func addRectangle() {
        shapes.append(Rectangle())
    }
}

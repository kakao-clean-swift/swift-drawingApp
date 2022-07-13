//
//  RectangleDraw.swift
//  swift-drawingapp
//
//  Created by Hochang Lee on 2022/07/04.
//

import Foundation

protocol FigureDrawable: PaperDrawable {
    func draw(at point: Point) -> Figureable
}

final class RectangleDraw: FigureDrawable {
    private let width: Float
    private let height: Float
    
    private let paperWidth: Float
    private let paperHeight: Float
    
    init(width: Float, height: Float, paperWidth: Float, paperHeight: Float) {
        self.width = width
        self.height = height
        self.paperWidth = paperWidth
        self.paperHeight = paperHeight
    }
    
    func canDraw(at point: Point) -> Bool {
        if (point.x + width > paperWidth) || (point.y + height > paperHeight) {
            return false
        } else {
            return true
        }
    }
    
    func draw(at point: Point) -> Figureable {
        return Rectangle(origin: point, size: Size(width: width, height: height))
    }
}

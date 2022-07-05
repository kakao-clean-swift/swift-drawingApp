//
//  PathDraw.swift
//  swift-drawingapp
//
//  Created by Hochang Lee on 2022/07/05.
//

import Foundation

protocol PathDrawable: PaperDrawable {
    func startDraw(at point: Point)
    func continueDraw(at point: Point)
    func endDraw(at point: Point) -> [Point]
}

final class PathDraw: PathDrawable {
    private let paperWidth: Float
    private let paperHeight: Float
    
    private var paths = [Point]()

    init(paperWidth: Float, paperHeight: Float) {
        self.paperWidth = paperWidth
        self.paperHeight = paperHeight
    }
    
    func canDraw(at point: Point) -> Bool {
        let x = point.x
        let y = point.y
        
        if x < 0 || y < 0 || x > paperWidth || y > paperHeight {
            return false
        } else {
            return true
        }
    }

    func startDraw(at point: Point) {
        paths = [point]
    }
    
    func continueDraw(at point: Point) {
        paths.append(point)
    }
    
    func endDraw(at point: Point) -> [Point] {
        paths.append(point)
        
        return paths
    }
}

//
//  DrawManager.swift
//  swift-drawingapp
//
//  Created by main on 2022/07/07.
//

import Foundation

protocol DrawManagerDelegate: AnyObject {
    func draw()
}

final class DrawManager {
    private var drawObjects: DrawObjects
    weak var delegate: ViewDelegate?
    
    init() {
        self.drawObjects = DrawObjects()
        self.drawObjects.delegate = self
    }
    
    func drawRectangle() {
        let rectangle = Rectangle(color: .random, point: .random)
        drawObjects.add(rectangle)
    }
}

extension DrawManager: DrawManagerDelegate {
    func draw() {
        delegate?.viewRefresh(drawObjects: drawObjects.array)
    }
}

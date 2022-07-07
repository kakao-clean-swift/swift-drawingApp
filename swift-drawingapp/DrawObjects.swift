//
//  DrawObjects.swift
//  swift-drawingapp
//
//  Created by main on 2022/07/07.
//

import Foundation

class DrawObjects {
    private(set) var array: [DrawObject] = []
    weak var delegate: DrawManagerDelegate?
    
    init(objects: [DrawObject] = []) {
        self.array = objects
    }
    
    func add(_ object: DrawObject) {
        self.array.append(object)
        delegate?.draw()
    }
}

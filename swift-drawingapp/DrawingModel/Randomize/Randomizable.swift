//
//  Randomizable.swift
//  swift-drawingapp
//
//  Created by jaychoi on 2022/07/04.
//

import Foundation

protocol Randomizable {
    
    associatedtype Value
    
    static func value() -> Value
    
}

protocol Boundable {
    associatedtype Value
    func calibration(value: Value) -> Value
}

protocol BoundaryRandomizable {
    associatedtype Boundary = Boundable
    associatedtype Value
    
    static func value(in boundary: Boundary) -> Value
}

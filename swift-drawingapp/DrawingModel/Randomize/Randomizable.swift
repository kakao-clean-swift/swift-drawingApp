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

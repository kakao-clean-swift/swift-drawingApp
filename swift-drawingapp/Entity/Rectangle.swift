//
//  Rectangle.swift
//  swift-drawingapp
//
//  Created by Hochang Lee on 2022/07/05.
//

import Foundation

protocol Figureable { }

struct Rectangle: Figureable {
    let origin: Point
    let size: Size
}

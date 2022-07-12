//
//  Shape.swift
//  swift-drawingapp
//
//  Created by kakao on 2022/07/04.
//

import Foundation

class Shape: Codable, Equatable {
    let id: String

    init() {
        id = UUID().uuidString
    }

    static func == (lhs: Shape, rhs: Shape) -> Bool {
        lhs.id == rhs.id
    }
}

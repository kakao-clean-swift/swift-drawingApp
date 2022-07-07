//
//  DrawableFactory.swift
//  swift-drawingapp
//
//  Created by 윤준수 on 2022/07/04.
//

import Foundation

struct DrawableFactory {
    static func makeShape(drawInfo: Draw) -> any Drawable {
        switch drawInfo.type {
        case .rectangle:
        case .line:
        }
    }
}

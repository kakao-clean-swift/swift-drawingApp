//
//  Draw.swift
//  swift-drawingapp
//
//  Created by 윤준수 on 2022/07/04.
//

import Foundation

struct Draw {
    var points: [Point]
    var color: Color
    var type: DrawType
}

enum DrawType {
    case rectangle
    case line
}

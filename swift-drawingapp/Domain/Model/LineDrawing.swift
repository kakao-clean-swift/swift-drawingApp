//
//  LineDrawing.swift
//  swift-drawingapp
//
//  Created by kakao on 2022/07/04.
//

import UIKit

struct LineDrawing: LineType, Drawing {
    var paths = [CGPoint]()
    var isSelected: Bool = false
}

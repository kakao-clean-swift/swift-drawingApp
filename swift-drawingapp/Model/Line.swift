//
//  Line.swift
//  swift-drawingapp
//
//  Created by kakao on 2022/07/04.
//

import UIKit

final class Line: Shape {
    let points: [CGPoint]

    init(points: [CGPoint]) {
        self.points = points
        super.init()
    }
}

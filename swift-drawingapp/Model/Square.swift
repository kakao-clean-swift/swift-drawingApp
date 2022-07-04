//
//  Square.swift
//  swift-drawingapp
//
//  Created by kakao on 2022/07/04.
//

import UIKit

final class Square: Shape {
    var center: CGPoint
    var size: CGSize

    init(center: CGPoint, size: CGSize) {
        self.center = center
        self.size = size
        super.init()
    }
}

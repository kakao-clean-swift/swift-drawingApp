//
//  DrawingObject+ItemDrawable.swift
//  swift-drawingapp
//
//  Created by fran on 2022/07/04.
//

import UIKit

protocol ItemDrawable {
    var drawID: String { get } // unique id
    var fill: Bool { get }  // frame 을 다 채울지 여부 (square 인지 구분)
    var color: UIColor { get }
    var points: [CGPoint] { get }
}

extension DrawingObject: ItemDrawable {
    var drawID: String {
        return id
    }

    var fill: Bool {
        return type == .square
    }
}

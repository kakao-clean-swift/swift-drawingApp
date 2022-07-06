//
//  DefaultRandomFrame.swift
//  swift-drawingapp
//
//  Created by jaychoi on 2022/07/04.
//

import Foundation
import CoreGraphics

struct DefaultRandomFrame: BoundaryRandomizable {
    
    static func value(in boundary: FrameBoundary) -> CGRect {
        boundary.calibration(value: CGRect(x: CGFloat.random(in: 0...boundary.screen.size.width),
                                           y: CGFloat.random(in: 0...boundary.screen.size.height),
                                           width: boundary.size.width, height: boundary.size.height))
    }
    
}

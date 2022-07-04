//
//  FrameBoundary.swift
//  swift-drawingapp
//
//  Created by jaychoi on 2022/07/04.
//

import Foundation
import CoreGraphics

struct FrameBoundary: Boundable {
    let screen: Screen
    let size: CGSize
    
    func calibration(value: CGRect) -> CGRect {
        var frame = value
        if frame.origin.x < 0 {
            frame.origin.x = 0.0
        }
        if frame.origin.y < 0 {
            frame.origin.y = 0.0
        }
        if frame.maxX > screen.size.width {
            frame.origin.x = screen.size.width - frame.width
        }
        if frame.maxY > screen.size.height {
            frame.origin.y = screen.size.height - frame.height
        }
        return frame
    }
}

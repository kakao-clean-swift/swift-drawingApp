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
        return frame
    }
}

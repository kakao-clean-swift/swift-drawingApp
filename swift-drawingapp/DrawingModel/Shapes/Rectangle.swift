//
//  Rectangle.swift
//  swift-drawingapp
//
//  Created by jaychoi on 2022/07/04.
//

import Foundation
import UIKit

final class Rectangle: Shape {

    let id: UUID = .init()
   
    let stroke: UIColor
    var frame: CGRect
    
    init(stroke: UIColor, frame: CGRect) {
        self.stroke = stroke
        self.frame = frame
    }
    
}

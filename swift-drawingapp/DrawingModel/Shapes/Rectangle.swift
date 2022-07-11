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
   
    let color: UIColor
    var frame: CGRect
    
    init(color: UIColor, frame: CGRect) {
        self.color = color
        self.frame = frame
    }
    
}

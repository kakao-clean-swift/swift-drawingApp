//
//  Rectangle.swift
//  swift-drawingapp
//
//  Created by jaychoi on 2022/07/04.
//

import Foundation
import UIKit

public final class Rectangle: Shape {

    public let id: UUID = .init()
   
    public let stroke: UIColor
    public var frame: CGRect
    
    public init(stroke: UIColor, frame: CGRect) {
        self.stroke = stroke
        self.frame = frame
    }
    
}

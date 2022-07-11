//
//  Shapes.swift
//  swift-drawingapp
//
//  Created by jaychoi on 2022/07/04.
//

import Foundation
import UIKit

protocol Shape {
    var id: UUID { get }
    
    var frame: CGRect { get set }
    
    var color: UIColor { get }
}

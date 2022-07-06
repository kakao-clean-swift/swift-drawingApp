//
//  DrawViewModel.swift
//  swift-drawingapp
//
//  Created by bean Milky on 2022/07/04.
//

import Foundation
import Combine

class DrawViewModel {
    @Published var shapes: [Shape] = []
    var shapeRange: ShapeRange = ShapeRange()
}

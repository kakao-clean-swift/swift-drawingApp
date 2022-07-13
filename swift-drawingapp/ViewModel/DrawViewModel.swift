//
//  DrawViewModel.swift
//  swift-drawingapp
//
//  Created by bean Milky on 2022/07/04.
//

import Foundation
import Combine

class DrawViewModel: ObservableObject {
    @Published var shapes: [Shape] = []
    @Published var shouldSync: Bool = false
    var planeRange: ShapeRange = ShapeRange()
}

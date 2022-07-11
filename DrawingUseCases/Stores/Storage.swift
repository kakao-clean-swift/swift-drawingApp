//
//  Storage.swift
//  DrawingUseCases
//
//  Created by jaychoi on 2022/07/11.
//

import Foundation
import DrawingShapes

public protocol Storage {
    func add<S>(shape: S) async throws where S: Shape
}

//
//  IdenditiableRectangle.swift
//  swift-drawingapp
//
//  Created by Hochang Lee on 2022/07/08.
//

import Foundation

protocol DrawingIdentifiable {
    var id: UUID { get }
}

final class RectangleViewModel: DrawingIdentifiable {
    let id = UUID()
    let rectangle: Rectangle
    var canSelect: Bool
    var isSelected: Bool = false
    
    init(rectangle: Rectangle, canSenect: Bool) {
        self.rectangle = rectangle
        self.canSelect = canSenect
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: RectangleViewModel, rhs: RectangleViewModel) -> Bool {
        return lhs.id == rhs.id
    }
}

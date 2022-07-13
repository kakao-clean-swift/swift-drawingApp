//
//  RectangleViewModel.swift
//  swift-drawingapp
//
//  Created by Hochang Lee on 2022/07/08.
//

import Foundation

final class RectangleViewModel {
    let id = UUID()
    let rectangle: Rectangle
    var canSelect: Bool
    private var _isSelected: Bool = false
    var isSelected: Bool { _isSelected }
    
    init(rectangle: Rectangle, canSenect: Bool) {
        self.rectangle = rectangle
        self.canSelect = canSenect
    }
    
    func select() {
        _isSelected.toggle()
    }
}

extension RectangleViewModel: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: RectangleViewModel, rhs: RectangleViewModel) -> Bool {
        return lhs.id == rhs.id
    }
}

//
//  DrawableSquare.swift
//  swift-drawingapp
//
//  Created by 윤준수 on 2022/07/04.
//

import Foundation

class Rectangle: Drawable, Selectable {
    var id: UUID = UUID()
    var unavailableColors: [Color] = [.red]
    var isSelectable: Bool
    
    init(isSelectable: Bool = true) {
        self.isSelectable = isSelectable
    }
}

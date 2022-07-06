//
//  LineDrawing.swift
//  swift-drawingapp
//
//  Created by 윤준수 on 2022/07/04.
//

import Foundation

class LineDrawing: Drawable {
    var id: UUID = UUID()
    var unavailableColors: [Color] = [.red]
    
    init() {
    }
}

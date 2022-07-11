//
//  RectangleViewModel.swift
//  swift-drawingapp
//
//  Created by 윤준수 on 2022/07/11.
//

import UIKit

class RectangleViewModel {
    var id: String = UUID().uuidString
    let origin: CGPoint
    let size: CGSize
    var color: UIColor
    let isSelectable: Bool
    
    init(origin: CGPoint, size: CGSize, color: UIColor, isSelectable: Bool) {
        self.origin = origin
        self.size = size
        self.color = color
        self.isSelectable = isSelectable
    }
}

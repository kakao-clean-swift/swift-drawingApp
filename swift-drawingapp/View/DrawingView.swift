//
//  LineView.swift
//  swift-drawingapp
//
//  Created by Hailey on 2022/07/05.
//

import UIKit

final class DrawingView: UIImageView {

    var drawing: Drawing

    init(drawing: Drawing) {
        self.drawing = drawing
        super.init(frame: drawing.rect)
        image = drawing.image
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

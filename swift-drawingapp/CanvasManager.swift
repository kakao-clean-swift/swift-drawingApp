//
//  DrawingManager.swift
//  swift-drawingapp
//
//  Created by Hailey on 2022/07/04.
//

import UIKit

final class CanvasManager {

    var squares: [Square] = []
    private var selectedSquareID: String = ""

    func drawSquare(in view: UIView) {
        let square = Square(in: view.frame)
        square.action = self
        view.addSubview(square)
        squares.append(square)
    }
}

extension CanvasManager: SquareAction {

    func didSelectSquare(_ id: String) {
        squares.forEach {
            $0.deselect()
        }

        selectedSquareID = id
    }
}

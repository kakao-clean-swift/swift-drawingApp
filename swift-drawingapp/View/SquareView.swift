//
//  Square.swift
//  swift-drawingapp
//
//  Created by Hailey on 2022/07/04.
//

import UIKit

protocol SquareAction {
    func squareView(_ squareView: SquareView, didSelectSquareOf id: String)
}

final class SquareView: UIView {

    var square: Square

    private var isSelected: Bool = false {
        didSet {
            layer.borderWidth = isSelected ? 5 : 0
        }
    }

    var action: SquareAction?

    init(square: Square) {
        self.square = square
        super.init(frame: square.rect)

        backgroundColor = UIColor.random
        layer.borderColor = UIColor.systemRed.cgColor
        isUserInteractionEnabled = true
        setupGesture()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func deselect() {
        isSelected = false
    }

    private func setupGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapSquare(_:)))
        addGestureRecognizer(gesture)
    }

    @objc private func didTapSquare(_ sender: UIGestureRecognizer) {
        action?.squareView(self, didSelectSquareOf: square.id)
        isSelected = true
    }
}

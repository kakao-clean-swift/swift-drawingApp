//
//  Square.swift
//  swift-drawingapp
//
//  Created by Hailey on 2022/07/04.
//

import UIKit

protocol SquareAction {
    func didSelectSquare(_ id: String)
}

final class Square: Figure {

    private let width: CGFloat = 100
    private let height: CGFloat = 100

    private var isSelected: Bool = false {
        didSet {
            layer.borderWidth = isSelected ? 5 : 0
        }
    }

    var action: SquareAction?

    init(in rect: CGRect) {
        super.init(frame: .zero)
        frame = getRandomRect(in: rect)
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

    private func getRandomRect(in rect: CGRect) -> CGRect {
        let rangeOfX = 0...(rect.width - width)
        let rangeOfY = 0...(rect.height - height)

        let x = CGFloat.random(in: rangeOfX)
        let y = CGFloat.random(in: rangeOfY)
        return CGRect(x: x, y: y, width: width, height: height)
    }

    private func setupGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapSquare(_:)))
        addGestureRecognizer(gesture)
    }

    @objc private func didTapSquare(_ sender: UIGestureRecognizer) {
        action?.didSelectSquare(id)
        isSelected = true
    }
}

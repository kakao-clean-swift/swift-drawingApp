//
//  SquarView.swift
//  swift-drawingapp
//
//  Created by kakao on 2022/07/04.
//

import UIKit

final class SquareView: ShapeView {
    static let size = CGSize(width: 100, height: 100)

    private var selected: Bool = false {
        didSet {
            layer.borderWidth = selected ? 3 : 0
            layer.borderColor = UIColor.systemRed.cgColor
        }
    }

    convenience init(square: Square, color: UIColor) {
        self.init(frame: CGRect(origin: .zero, size: square.size))
        self.shape = square
        self.center = square.center
        self.backgroundColor = color
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(touchSquareView(gesture:))))
    }
    
    @objc private func touchSquareView(gesture: UITapGestureRecognizer) {
        guard isReceived == false else { return }
        
        selected.toggle()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

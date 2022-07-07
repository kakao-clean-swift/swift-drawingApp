//
//  Square.swift
//  swift-drawingapp
//
//  Created by Hailey on 2022/07/05.
//

import CoreGraphics

struct Square {
    var id: String = ""
    var rect: CGRect = .zero
    private var width: CGFloat = 100
    private var height: CGFloat = 100

    init(in rect: CGRect) {
        self.rect = createRandomRect(in: rect)
    }

    func createRandomRect(in rect: CGRect) -> CGRect {
        let rangeOfX = 0...(rect.width - CGFloat(width))
        let rangeOfY = 0...(rect.height - CGFloat(height))

        let x = CGFloat.random(in: rangeOfX)
        let y = CGFloat.random(in: rangeOfY)
        return CGRect(x: x, y: y, width: width, height: height)
    }
}

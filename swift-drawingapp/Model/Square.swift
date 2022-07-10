//
//  Square.swift
//  swift-drawingapp
//
//  Created by kakao on 2022/07/04.
//

import UIKit

final class Square: Shape {
    var center: CGPoint
    var size: CGSize

    init(center: CGPoint, size: CGSize) {
        self.center = center
        self.size = size
        super.init()
    }

    private enum CodingKeys: String, CodingKey {
        case center, size
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.center = try! container.decode(CGPoint.self, forKey: .center)
        self.size = try! container.decode(CGSize.self, forKey: .size)

        try super.init(from: decoder)
    }
}

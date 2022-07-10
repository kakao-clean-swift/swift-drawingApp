//
//  Line.swift
//  swift-drawingapp
//
//  Created by kakao on 2022/07/04.
//

import UIKit

final class Line: Shape {
    let points: [CGPoint]

    init(points: [CGPoint]) {
        self.points = points
        super.init()
    }

    private enum CodingKeys: String, CodingKey {
        case points
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.points = try! container.decode([CGPoint].self, forKey: .points)

        try super.init(from: decoder)
    }
}

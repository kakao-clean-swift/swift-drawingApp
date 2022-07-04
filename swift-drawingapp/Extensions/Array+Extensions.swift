//
//  Array+Extensions.swift
//  swift-drawingapp
//
//  Created by kakao on 2022/07/04.
//

import UIKit

extension Array where Element == CGPoint {
    var minX: CGFloat {
        self.min(by: { $0.x < $1.x })?.x ?? 0
    }

    var minY: CGFloat {
        self.min(by: { $0.y < $1.y })?.y ?? 0
    }

    var maxX: CGFloat {
        self.max(by: { $0.x < $1.x })?.x ?? 0
    }

    var maxY: CGFloat {
        self.max(by: { $0.y < $1.y })?.y ?? 0
    }
}

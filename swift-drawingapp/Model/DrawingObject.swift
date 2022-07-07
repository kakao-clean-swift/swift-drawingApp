//
//  DrawingObject.swift
//  swift-drawingapp
//
//  Created by fran on 2022/07/04.
//

import UIKit

enum DrawingObjectType {
    case square
    case manual
    case none

    var fixedLength: CGFloat {
        switch self {
        case .square: return 100
        default: return 0
        }
    }
}

class DrawingObject: ItemDrawable {
    var id: String = UUID().uuidString  // unique id
    var type: DrawingObjectType = .none    
    var color: UIColor = .systemGray
    var points: [CGPoint] = []
    var drawingType: DrawingType {
        return (type == .square) ? .fill : .line
    }

    var startPoint: CGPoint {
        return (points.count > 0) ? points[0] : .zero
    }

    var fixedLength: CGFloat {
        return type.fixedLength
    }

    init(type: DrawingObjectType, color: UIColor) {
        self.type = type
        self.color = color
    }
}

extension DrawingObject: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: DrawingObject, rhs: DrawingObject) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}




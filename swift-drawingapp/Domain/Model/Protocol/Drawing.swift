//
//  Drawing.swift
//  swift-drawingapp
//
//  Created by kakao on 2022/07/04.
//

import UIKit

protocol Drawing: Color {
    var id: UUID { get }
    var isSelected: Bool { get set }
}

extension Drawing {
    var id: UUID {
            UUID()
    }
    var color: UIColor {
        .systemRandom
    }
}

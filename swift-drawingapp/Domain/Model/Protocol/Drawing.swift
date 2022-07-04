//
//  Drawing.swift
//  swift-drawingapp
//
//  Created by kakao on 2022/07/04.
//

import Foundation

protocol Drawing: Color {
    var id: UUID { get }
    var isSelected: Bool { get set }
}

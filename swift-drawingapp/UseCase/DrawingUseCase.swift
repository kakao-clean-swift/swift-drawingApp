//
//  DrawingUseCase.swift
//  swift-drawingapp
//
//  Created by kakao on 2022/07/04.
//

import Foundation

protocol DrawingUseCase {
    func login(id: String)
    func sendShapes(_ shapes: [Shape]) throws
}

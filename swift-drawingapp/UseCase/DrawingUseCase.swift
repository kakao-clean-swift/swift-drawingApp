//
//  DrawingUseCase.swift
//  swift-drawingapp
//
//  Created by kakao on 2022/07/04.
//

import Foundation

protocol DrawingUseCase {
    func sendData(_ data: Data)
    func receiveData(_ data: Data)
}

//
//  DrawingPort.swift
//  swift-drawingapp
//
//  Created by kakao on 2022/07/11.
//

import Foundation

protocol DrawingRequestPort {
    func startLogin(id: String)
    func sendData(_ data: Data)
    func receiveData(_ data: Data)
}

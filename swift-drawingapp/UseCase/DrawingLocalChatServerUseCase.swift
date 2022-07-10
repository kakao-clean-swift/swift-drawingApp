//
//  DrawingSyncManager.swift
//  swift-drawingapp
//
//  Created by kakao on 2022/07/04.
//

import Foundation

enum SyncError: Error {
    case notLogin
}

protocol DrawingLocalChatServerDelegate: AnyObject {
    func drawingLocalChatServer(didFail error: Error)
}

class DrawingLocalChatServerUseCase: DrawingUseCase {
    weak var delegate: DrawingLocalChatServerDelegate!

    init(delegate: DrawingLocalChatServerDelegate) {
        self.delegate = delegate
    }

    func sendData(_ data: Data) {
        print("데이터 전송....")
    }

    func receiveData(_ data: Data) {
        print("데이터 리시브....")
    }
}

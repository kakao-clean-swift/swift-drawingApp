//
//  DrawingLocalServerRequestPort.swift
//  swift-drawingapp
//
//  Created by kakao on 2022/07/11.
//

import Foundation

final class DrawingLocalServerRequestPort: DrawingRequestPort {
    private var presenter: DrawingPresenter

    init(presenter: DrawingPresenter) {
        self.presenter = presenter
    }

    func startLogin(id: String) {
        // 서버로 로그인 리퀘스트 전송.

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.presenter.loginState.send(true)
        }
    }

    func sendData(_ data: Data) {
        // 서버로 데이터 전송.
        print("데이터 전송 완료!!")
    }

    func receiveData(_ data: Data) {
        // 서버로 부터 받은 데이터를 컴바인으로 전송.
        presenter.receivedShape.send(data)
    }
}

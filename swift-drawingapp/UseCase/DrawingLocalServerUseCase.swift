//
//  DrawingSyncManager.swift
//  swift-drawingapp
//
//  Created by kakao on 2022/07/04.
//

import Foundation
import Combine

enum DrawingLocalServerError: Error {
    case notLogin
    case emptyScreen
}

final class DrawingLocalServerUseCase: DrawingUseCase {
    private var cancellables = Set<AnyCancellable>()
    private var drawingRequestPort: DrawingRequestPort!
    private var isLogin: Bool = false

    init(presenter: DrawingPresenter) {
        self.drawingRequestPort = DrawingLocalServerRequestPort(presenter: presenter)

        presenter.loginState.sink(receiveValue: { isLogin in
            self.isLogin = isLogin
        }).store(in: &cancellables)
    }

    func login(id: String) {
        drawingRequestPort.startLogin(id: id)
    }

    func sendShapes(_ shapes: [Shape]) throws {
        if shapes.isEmpty {
            throw DrawingLocalServerError.emptyScreen
        }

        if !isLogin {
            throw DrawingLocalServerError.notLogin
        }

        shapes.forEach { shape in
            guard let encodedShape = try? JSONEncoder().encode(shape) else { return }

            drawingRequestPort.sendData(encodedShape)
        }
    }
}

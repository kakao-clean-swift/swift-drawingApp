//
//  DIRoot.swift
//  swift-drawingapp
//
//  Created by kakao on 2022/07/05.
//

import Foundation

class DIRoot {
    let container: Container
    
    init(container: Container) {
        self.container = container
    }
    
    func register() {
        let drawingUseCase = DrawingUseCase(
            apiClient: DrawingAPIClient(),
            board: WhiteBoard()
        )
        let drawingViewModel = DrawingViewModel(useCase: drawingUseCase)
        container.register(drawingViewModel)
    }
    
    func removeAll() {
        container.removeAll()
    }
}

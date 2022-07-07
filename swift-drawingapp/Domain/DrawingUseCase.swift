//
//  DrawingUseCase.swift
//  swift-drawingapp
//
//  Created by kakao on 2022/07/04.
//

import Foundation

protocol BaseUseCase: DIRegisterable {
    var apiClient: DrawingAPIType { get }
    var board: Board { get }
}

protocol DrawingLogic: BaseUseCase {
    func addSquare()
}

class DrawingUseCase: DrawingLogic {
    let apiClient: DrawingAPIType
    let board: Board
    
    init(apiClient: DrawingAPIType, board: Board) {
        self.apiClient = apiClient
        self.board = board
    }
    
    func addSquare() {
        self.board.addSquare()
    }
}

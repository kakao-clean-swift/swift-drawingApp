//
//  DrawingUseCase.swift
//  swift-drawingapp
//
//  Created by kakao on 2022/07/04.
//

import Foundation

protocol BaseUseCase {
    var apiClient: DrawingAPI { get }
    var board: Board { get }
}

protocol DrawingLogic: BaseUseCase {
    func addSquare()
}

class DrawingUseCase: DrawingLogic {
    let apiClient: DrawingAPI
    
    init(apiClient: DrawingAPI, board: Board) {
        self.apiClient = apiClient
        self.board = board
    }
    
    func addSquare() {
        board.addSquare()
    }
}

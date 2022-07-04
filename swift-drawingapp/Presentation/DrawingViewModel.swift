//
//  DrawingViewModel.swift
//  swift-drawingapp
//
//  Created by kakao on 2022/07/04.
//

import Foundation

class DrawingViewModel {
    private let useCase: DrawingUseCase
    var drawings = [Drawing]()
    
    init(useCase: DrawingUseCase) {
        self.useCase = useCase
    }
    
    func addSquare() {
        self.useCase.addSquare()
    }
}

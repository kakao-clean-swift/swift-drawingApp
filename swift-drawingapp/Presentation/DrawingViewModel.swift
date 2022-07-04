//
//  DrawingViewModel.swift
//  swift-drawingapp
//
//  Created by kakao on 2022/07/04.
//

import Foundation

class DrawingViewModel: DIRegisterable {
    private let useCase: DrawingLogic
    var drawings = [Drawing]()
    
    init(useCase: DrawingLogic) {
        self.useCase = useCase
    }
    
    func addSquare() {
        self.useCase.addSquare()
    }
}

//
//  DrawingModel.swift
//  swift-drawingapp
//
//  Created by jaychoi on 2022/07/04.
//

import Foundation

final class Drawers {
    let screen: Screen
    init(screen: Screen) {
        self.screen = screen
    }
    
    private var shapes: [Shape] = []
    
    /// 현재까지 만들어진 모든 Shape의 갯수
    var countOfShapes: Int { shapes.count }
    
    func shape(of index: Int) -> Shape {
        shapes[index]
    }
    
    /// Rectangle을 추가
    func addRectangle() {
        shapes.append(Rectangle())
    }
}

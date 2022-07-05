//
//  DrawingViewModel.swift
//  swift-drawingapp
//
//  Created by joel.inju on 2022/07/04.
//

import UIKit

class DrawingViewModel {
    @Published var figures = [Figure]()
    @Published var selectedId: UUID?
    @Published var deselectedId: UUID?
    
    func createRect() {
        // rect를 생성한다.
        let rect = Rect(randomPoint())
        figures.append(rect)
    }
    
    init() {
        
    }
    
    private func randomPoint() -> Point {
        let x = Int(arc4random_uniform(UInt32(UIScreen.main.bounds.width)))
        let y = Int(arc4random_uniform(UInt32(UIScreen.main.bounds.height)))
        return Point(x: x, y: y)
    }
    
    func touched(_ id: UUID?) {
        guard let id = id else { return }
        
        if selectedId == id {
            deselectedId = id
            selectedId = nil
        } else {
            deselectedId = selectedId
            selectedId = id
        }
    }
}

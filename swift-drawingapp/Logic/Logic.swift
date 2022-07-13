//
//  Logic.swift
//  swift-drawingapp
//
//  Created by joel.inju on 2022/07/12.
//

import Foundation

class Logic: CreateFigureUseCase,
              SelectFigureUseCase {
    
    private var presenterPort: PresenterPort?
    private var selectedId: UUID?
    private var deselectedId: UUID?
    
    func createRect() -> Figure {
        let randomPoint = Point()
        let rect = Figure(randomPoint)
        return rect
    }
    
    func setPresenter(with port: PresenterPort?) {
        self.presenterPort = port
    }
    
    func touchRect(_ id: UUID?) -> (UUID?, UUID?) {
        guard let id = id else { return (nil, nil) }

        if selectedId == id {
            deselectedId = id
            selectedId = nil
        } else {
            deselectedId = selectedId
            selectedId = id
        }
        
        return (selectedId, deselectedId)
    }
}

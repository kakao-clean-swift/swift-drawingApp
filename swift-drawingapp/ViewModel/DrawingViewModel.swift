//
//  DrawingViewModel.swift
//  swift-drawingapp
//
//  Created by joel.inju on 2022/07/04.
//

import Foundation

class DrawingViewModel {
    @Published var rects = [Figure]()
    @Published var drawings = [Figure]()
    
    private var selectedId: UUID?
    private var deselectedId: UUID?
    private var presenterPort: PresenterPort?
    
    init() {
        
    }
}

extension DrawingViewModel: CreateFigureUseCase {
    func createRect() {
        let randomPoint = Point()
        let rect = Figure(randomPoint)
        rects.append(rect)
    }
}

extension DrawingViewModel: SelectFigureUseCase {
    func setPresenter(with port: PresenterPort?) {
        self.presenterPort = port
    }
    
    func touchRect(_ id: UUID?) {
        guard let id = id else { return }

        if selectedId == id {
            deselectedId = id
            selectedId = nil
        } else {
            deselectedId = selectedId
            selectedId = id
        }
        
        self.presenterPort?.touchRect(deselectedId, selectedId)
    }
}

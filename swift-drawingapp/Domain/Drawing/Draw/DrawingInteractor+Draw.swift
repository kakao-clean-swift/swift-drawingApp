//
//  DrawingInteractor.swift
//  swift-drawingapp
//
//  Created by kakao on 2022/07/10.
//

import Foundation

protocol DrawingDataStore {
    var canvas: Canvas { get }
}

protocol DrawDrawingBusinessLogic {
    func draw(item: DrawingComponentType)
}

class DrawingInteractor: DrawDrawingBusinessLogic {
    
    typealias DrawingPresentationLogic = (DrawDrawingPresentationLogic & MoveDrawingPresentationLogic & SelectDrawingPresentationLogic & SyncDrawingPresentationLogic)
    
    var canvas: Canvas
    var presenter: DrawingPresentationLogic
    
    init(presenter: DrawingPresentationLogic, canvas: Canvas) {
        self.presenter = presenter
        self.canvas = canvas
    }
    
    func draw(item: DrawingComponentType) {
        guard let item = self.canvas.addDrawingItem(item: item) else {
            return
        }
        self.presenter.presentDraw(drawComponentType: item)
    }
    
    
    

    
    func login() {
        
    }
}

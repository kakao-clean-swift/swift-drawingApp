//
//  CreateDrawingUseCase.swift
//  swift-drawingapp
//
//  Created by fran on 2022/07/11.
//

import Foundation

protocol CreateDrawingUseCase {
    func didTapDrawing(type: DrawingType)
    func didStartDrawing(type: DrawingType)
    func didEndDrawing(type: DrawingType, points: [Point])
    func createDrawingObject(type: DrawingType, points: [Point])
    func updateDrawing() 
}

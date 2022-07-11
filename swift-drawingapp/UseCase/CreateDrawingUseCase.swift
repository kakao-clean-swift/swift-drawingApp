//
//  CreateDrawingUseCase.swift
//  swift-drawingapp
//
//  Created by fran on 2022/07/11.
//

import Foundation

/**
 이벤트를 받아서 오브젝트를 생성한다. 
 */

protocol CreateDrawingUseCase {
    func didTapDrawing(type: DrawingObjectType)
    func startDrawing(type: DrawingObjectType)
    func endDrawing(type: DrawingObjectType, points: [Point])
}

//
//  Painter.swift
//  swift-drawingapp
//
//  Created by 윤준수 on 2022/07/10.
//

import Foundation

final class Painter: DrawRectangleUsecase {
    private let pointManager: PointManager
    private let colorManager: ColorManager
    private let rectangleSize: Size = Size(width: 100, height: 100)
    
    init(sizeOfMap: Size) {
        pointManager = PointManager(generator: PointGenerator(maxPoint: Point(y: sizeOfMap.height, x: sizeOfMap.width)), sizeOfMap: sizeOfMap)
        self.colorManager = ColorManager(colorGenerator: RandomColorGenerator())
    }
}

// MARK: DrawRectangleUsecase

extension Painter {
    func drawRectangle() -> RectangleModel {
        return getRectangle()
    }
    
    private func getRectangle() -> RectangleModel {
        return RectangleModel(origin: pointManager.getOrigin(size: rectangleSize),
                              size: rectangleSize,
                              color: colorManager.getAvailableColor())
    }
    
    func getRectangle(unavailableColor: Color? = nil) -> RectangleModel {
        colorManager.resetUnavailableColors()
        if let unavailableColor = unavailableColor {
            colorManager.setUnavailableColors(unavailableColor)
        }
        
        return getRectangle()
    }
}

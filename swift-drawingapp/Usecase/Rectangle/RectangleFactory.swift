//
//  RectangleManager.swift
//  swift-drawingapp
//
//  Created by 윤준수 on 2022/07/10.
//

import Foundation

//struct RectangleFactory {
//    private let pointManager: PointManager
//    private let colorManager: ColorManager
//    
//    private let rectangleSize: Size = Size(width: 100, height: 100)
//    
//    init(pointGenerator: any PointGeneratorProtocol, colorManager: ColorManager, sizeOfMap: Size) {
//        pointManager = PointManager(generator: pointGenerator, sizeOfMap: sizeOfMap)
//        self.colorManager = colorManager
//    }
//    
//    private func getRectangle() -> RectangleModel {
//        return RectangleModel(origin: pointManager.getOrigin(size: rectangleSize),
//                              size: rectangleSize,
//                              color: colorManager.getAvailableColor())
//    }
//    
//    func getRectangle(unavailableColor: Color? = nil) -> RectangleModel {
//        colorManager.resetUnavailableColors()
//        if let unavailableColor = unavailableColor {
//            colorManager.setUnavailableColors(unavailableColor)
//        }
//        
//        return getRectangle()
//    }
//}

struct RectangleModel {
    let origin: Point
    let size: Size
    let color: Color
}

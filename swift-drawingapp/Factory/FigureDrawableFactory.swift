//
//  FigureDrawableFactory.swift
//  swift-drawingapp
//
//  Created by Hochang Lee on 2022/07/08.
//

import Foundation

final class FigureDrawableFactory {
    static func getFigureDrawable(paperWidth: Float, paperHeight: Float) -> FigureDrawable {
        return RectangleDraw(width: 100, height: 100, paperWidth: paperWidth, paperHeight: paperHeight)
    }
}

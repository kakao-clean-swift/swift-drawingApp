//
//  PathDrawableFactory.swift
//  swift-drawingapp
//
//  Created by Hochang Lee on 2022/07/08.
//

import Foundation

final class PathDrawableFactory {
    static func getPathDrawable(paperWidth: Float, paperHeight: Float) -> PathDrawable {
        return PathDraw(paperWidth: paperWidth, paperHeight: paperHeight)
    }
}

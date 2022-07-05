//
//  Drawable.swift
//  swift-drawingapp
//
//  Created by Hochang Lee on 2022/07/05.
//

import Foundation

protocol PaperDrawable {
    func canDraw(at point: Point) -> Bool
}

//
//  SelectDrawingUseCase.swift
//  swift-drawingapp
//
//  Created by fran on 2022/07/11.
//

import Foundation

/**
 오브젝트를 선택한다.
 */

protocol SelectDrawingUseCase {
    func didSelect(item: ItemDrawable) -> DrawingObject?
    func drawSelect(item: DrawingObject)
}

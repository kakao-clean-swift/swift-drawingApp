//
//  Colorable.swift
//  swift-drawingapp
//
//  Created by 윤준수 on 2022/07/04.
//

import Foundation

protocol Colorable {
    var unavailableColors: [Color] { get }
    var avaliableColors: [Color] { get }
}

extension Colorable {
    var avaliableColors: [Color] {
        return Color.allCases.filter({
            !unavailableColors.contains($0)
        })
    }
}

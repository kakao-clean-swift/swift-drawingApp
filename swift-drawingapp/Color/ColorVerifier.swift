//
//  ColorVerifier.swift
//  swift-drawingapp
//
//  Created by 윤준수 on 2022/07/10.
//

import Foundation

final class ColorVerifier {
    private let systemRedColor: Color = Color(red: 1, green: 0, blue: 0)
    private(set) var unAvailableColors: [Color] = []
    
    func isAvailableColor(color: Color) -> Bool {
        return !unAvailableColors.contains(where: { $0 == color })
    }
    
    func setUnavailableColor(_ color: Color) {
        unAvailableColors.append(color)
    }
    
    func resetUnavailableColors() {
        unAvailableColors = [systemRedColor]
    }
    
    init() {
        resetUnavailableColors()
    }
}

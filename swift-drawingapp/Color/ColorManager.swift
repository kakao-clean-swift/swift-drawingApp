//
//  ColorManager.swift
//  swift-drawingapp
//
//  Created by 윤준수 on 2022/07/10.
//

import Foundation

struct ColorManager {
    private var colorGenerator: any ColorGeneratorProtocol
    private var verifier: ColorVerifier
    
    func getAvailableColor() -> Color {
        var availableColor: Color
        repeat {
            availableColor = colorGenerator.getRandomColor()
        } while !verifier.isAvailableColor(color: availableColor)
        
        return availableColor
    }
    
    func setUnavailableColors(_ color: Color) {
        verifier.setUnavailableColor(color)
    }
    
    func resetUnavailableColors() {
        verifier.resetUnavailableColors()
    }
    
    init(colorGenerator: any ColorGeneratorProtocol) {
        self.colorGenerator = colorGenerator
        verifier = ColorVerifier()
    }
}

//
//  ColorGenerator.swift
//  swift-drawingapp
//
//  Created by 윤준수 on 2022/07/10.
//

import Foundation

protocol ColorGeneratorProtocol {
    func getRandomColor() -> Color
}

struct RandomColorGenerator: ColorGeneratorProtocol {
    func getRandomColor() -> Color {
        let red = Double.random(in: 0.0...1.0)
        let green = Double.random(in: 0.0...1.0)
        let blue = Double.random(in: 0.0...1.0)
        
        return Color(red: red, green: green, blue: blue)
    }
}

//
//  Color.swift
//  swift-drawingapp
//
//  Created by main on 2022/07/06.
//

import Foundation

final class Color {
    var red: Float
    var green: Float
    var blue: Float
    
    init(red: Float, green: Float, blue: Float) {
        self.red = red
        self.green = green
        self.blue = blue
    }
}

extension Color {
    static var random: Color {
        return Color(red: Float.random(in: 0...1),
                     green: Float.random(in: 0...1),
                     blue: Float.random(in: 0...1))
    }
}

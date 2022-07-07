//
//  ColorFactory.swift
//  swift-drawingapp
//
//  Created by Landon.kim on 2022/07/04.
//

import Foundation
import UIKit

class ColorFactory {
    static private let colors: [UIColor] = [.systemGreen, .systemBlue, .systemOrange, .systemYellow,
                                    .systemPink, .systemPurple, .systemTeal, .systemIndigo,
                                    .systemBrown, .systemGray, .systemGray2, .systemGray3,
                                    .systemGray4, .systemGray5, .systemGray6]
    
    static let selectedColor = UIColor.systemRed
    
    static public func randomColor() -> UIColor {
        colors.randomElement()!
    }
}

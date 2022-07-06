//
//  ColorRandomizer.swift
//  swift-drawingapp
//
//  Created by jaychoi on 2022/07/04.
//

import Foundation
import UIKit

struct DefaultRandomColorize: Randomizable {
    
    static func value() -> UIColor {
        [UIColor.systemRed,
         .systemGreen,
         .systemBlue,
         .systemOrange,
         .systemYellow,
         .systemPink,
         .systemPurple,
         .systemTeal,
         .systemIndigo,
         .systemBrown,
         .systemMint,
         .systemCyan,
         .systemGray,
         .systemGray2,
         .systemGray3,
         .systemGray4,
         .systemGray5,
         .systemGray6].randomElement()!
    }
    
}

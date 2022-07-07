//
//  UIColor+Extension.swift
//  swift-drawingapp
//
//  Created by Hailey on 2022/07/04.
//

import UIKit

extension UIColor {

    static var random: UIColor {
        let systemColors: [UIColor] = [.systemBlue, .systemCyan, .systemGray, .systemMint, .systemTeal, .systemBrown, .systemIndigo, .systemOrange, .systemYellow, .systemPurple]
        return systemColors.randomElement() ?? .systemGray
    }
}

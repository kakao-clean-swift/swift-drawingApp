//
//  UIColor+Extensions.swift
//  swift-drawingapp
//
//  Created by kakao on 2022/07/04.
//

import UIKit

extension UIColor {
    static var systemRandomColor: UIColor {
        let systemColors = [UIColor.systemGreen, UIColor.systemBlue, UIColor.systemGray,
                            UIColor.systemOrange, UIColor.systemYellow, UIColor.systemPink,
                            UIColor.systemPurple, UIColor.systemTeal, UIColor.systemIndigo,
                            UIColor.systemBrown, UIColor.systemMint, UIColor.systemCyan]

        return systemColors.randomElement()!
    }
}

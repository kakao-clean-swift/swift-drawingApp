//
//  UIColor+Extension.swift
//  swift-drawingapp
//
//  Created by kakao on 2022/07/04.
//

import UIKit

extension UIColor {
    static var systemRandom: UIColor {
        [
            UIColor.green
            ,UIColor.blue
            ,UIColor.cyan
            ,UIColor.yellow
            ,UIColor.magenta
            ,UIColor.orange
            ,UIColor.purple
            ,UIColor.brown
        ].randomElement() ?? .yellow
    }
}

//
//  UIView+Extension.swift
//  swift-drawingapp
//
//  Created by Hochang Lee on 2022/07/08.
//

import UIKit

extension UIView {
    convenience init(rect: Rectangle) {
        self.init(frame: Converter.toUIKit(rect))
    }
}

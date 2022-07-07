//
//  UIView+Extension.swift
//  swift-drawingapp
//
//  Created by joel.inju on 2022/07/04.
//

import UIKit

extension UIView {
    func systemColor(_ index: Int) -> UIColor {
        let colors: [UIColor] = [.systemBlue,
                                 .systemBrown,
                                 .systemGreen,
                                 .systemIndigo,
                                 .systemOrange,
                                 .systemPink,
                                 .systemPurple,
                                 .systemTeal,
                                 .systemYellow]
        return index <= 8 ? colors[index] : .systemGray
    }
}

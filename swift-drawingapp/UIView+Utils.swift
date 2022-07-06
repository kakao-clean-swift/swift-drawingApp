//
//  UIView+Utils.swift
//  swift-drawingapp
//
//  Created by main on 2022/07/07.
//

import UIKit

extension DrawObject {
    var cgColor: UIColor {
        return UIColor(red: CGFloat(self.color.red),
                       green: CGFloat(self.color.green),
                       blue: CGFloat(self.color.blue),
                       alpha: 1.0)
    }
    
    var cgPoint: CGPoint {
        return CGPoint(x: self.point.x, y: self.point.y)
    }
    
    var uiView: UIView {
        let size = CGSize(width: 100, height: 100)
        let view = UIView(frame: CGRect(origin: self.cgPoint, size: size))
        view.backgroundColor = self.cgColor
        return view
        //TODO 사각형과 드로우를 다형성을 유지하면서 각각 UIView로 변환하려면?
    }
}

//
//  DrawingModel.swift
//  swift-drawingapp
//
//  Created by jaychoi on 2022/07/04.
//

import Foundation
import CoreGraphics
import UIKit

final class Drawers<RandomColorize: Randomizable> where RandomColorize.Value == UIColor {
    
    let screen: Screen
    
    init(screen: Screen) {
        self.screen = screen
    }
    
    private var shapes: [Shape] = []
    
    /// 현재까지 만들어진 모든 Shape의 갯수
    var countOfShapes: Int { shapes.count }
    
    func shape(of index: Int) -> Shape {
        shapes[index]
    }
    
    /// Rectangle을 추가
    func addRectangle(_ size: CGSize = .init(width: 100, height: 100)) {
        shapes.append(Rectangle(color: RandomColorize.value(), frame: randomFrame(with: size)))
    }
    
    private func randomFrame(with size: CGSize) -> CGRect {
        let xPosition = CGFloat.random(in: 0..<screen.size.width - size.width)
        let yPosition = CGFloat.random(in: 0..<screen.size.height - size.height)
        return CGRect(origin: .init(x: xPosition, y: yPosition), size: size)
    }
}

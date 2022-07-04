//
//  DrawingModel.swift
//  swift-drawingapp
//
//  Created by jaychoi on 2022/07/04.
//

import Foundation
import CoreGraphics
import UIKit

final class Drawers {
    
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
        shapes.append(Rectangle(color: randomColor(), frame: randomFrame(with: size)))
    }
    
    private func randomColor() -> UIColor {
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
         .systemGray6].randomElement() ?? .systemBlue
    }
    
    private func randomFrame(with size: CGSize) -> CGRect {
        CGRect(origin: .zero, size: size)
    }
}

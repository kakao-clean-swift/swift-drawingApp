//
//  DrawingModel.swift
//  swift-drawingapp
//
//  Created by jaychoi on 2022/07/04.
//

import Foundation
import CoreGraphics
import UIKit

final class Drawers<RandomColorize: Randomizable, RandomFrame: BoundaryRandomizable>
where RandomColorize.Value == UIColor, RandomFrame.Boundary == FrameBoundary, RandomFrame.Value == CGRect {
    
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
        shapes.append(Rectangle(color: RandomColorize.value(),
                                frame: RandomFrame.value(in: .init(screen: screen, size: size))))
    }
}

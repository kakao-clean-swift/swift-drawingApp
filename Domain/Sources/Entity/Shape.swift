import Foundation
import UIKit
import Util

protocol Shape: Identifiable {
    var color: UIColor { get }
    var points: [CGPoint] { get }
    var isSelectable: Bool { get }
}

struct Rectangle: Shape {
    
    let id = UUID()
    let color: UIColor
    let points: [CGPoint]
    let isSelectable: Bool
    
    init(screenRect: CGRect,
         size: CGFloat = 100.0,
         isSelectable: Bool = true) {
        self.points = RandomPointsGenerator.rectangePoints(screenRect: screenRect, size: size)
        self.color = RandomColorGenerator.color()
        self.isSelectable = isSelectable
    }
}

struct LineDrawing: Shape {
    
    let id = UUID()
    let color: UIColor
    private(set) var points: [CGPoint] = []
    let isSelectable: Bool = false
    
    init() {
        self.color = RandomColorGenerator.color()
    }
    
    mutating func addPoint(_ point: CGPoint) {
        points.append(point)
    }
}

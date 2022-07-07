import Foundation
import UIKit
import Util

protocol Shape: Identifiable {
    var color: UIColor { get }
    var points: [CGPoint] { get }
    var isSelectable: Bool { get }
}

// DTO를 만든다면 DTO가 Codable을 채택할 것!
struct Rectangle: Shape, Codable {
    
    let id: UUID
    let colorHex: String
    let points: [CGPoint]
    let isSelectable: Bool
    
    var color: UIColor { return UIColor(hex: colorHex) ?? .clear }

    init(screenRect: CGRect,
         size: CGFloat = 100.0,
         isSelectable: Bool = true) {
        self.id = UUID()
        self.colorHex = RandomColorGenerator.color().hex
        self.points = RandomPointsGenerator.rectangePoints(screenRect: screenRect, size: size)
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

import Foundation
import UIKit
import Util

public protocol Shape {
    var id: UUID { get }
    var color: UIColor { get }
    var points: [CGPoint] { get }
    var isSelectable: Bool { get }
}

// DTO를 만든다면 DTO가 Codable을 채택할 것!
public struct Rectangle: Shape, Codable {
    
    public let id: UUID
    let colorHex: String
    public let points: [CGPoint]
    public let isSelectable: Bool
    
    public var color: UIColor { return UIColor(hex: colorHex) ?? .clear }

    public init(screenRect: CGRect,
                size: CGFloat = 100.0,
                isSelectable: Bool = true) {
        self.id = UUID()
        self.colorHex = RandomColorGenerator.color().hex
        self.points = RandomPointsGenerator.rectangePoints(screenRect: screenRect, size: size)
        self.isSelectable = isSelectable
    }
}

public struct LineDrawing: Shape {
    
    public let id = UUID()
    public let color: UIColor
    public private(set) var points: [CGPoint] = []
    public let isSelectable: Bool = false
    
    public init(initialPoint: CGPoint) {
        self.color = RandomColorGenerator.color()
        self.addPoint(initialPoint)
    }
    
    public mutating func addPoint(_ point: CGPoint) {
        points.append(point)
    }
}

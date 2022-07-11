import Foundation
import UIKit
import Util

public protocol Shape {
    var id: UUID { get }
    var color: UIColor { get }
    var points: [CGPoint] { get }
    var isSelectable: Bool { get }
}

public protocol ModifiableShape: Shape {
    mutating func addPoint(_ point: CGPoint)
}

public struct Rectangle: Shape {
    
    public let id: UUID
    public let color: UIColor
    public let points: [CGPoint]
    public let isSelectable: Bool
    
    public init(screenRect: CGRect,
                size: CGFloat = 100.0,
                isSelectable: Bool = true) {
        self.id = UUID()
        self.color = RandomColorGenerator.color()
        self.points = RandomPointsGenerator.rectangePoints(screenRect: screenRect, size: size)
        self.isSelectable = isSelectable
    }
}

public struct LineDrawing: ModifiableShape {

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

import Foundation

struct Rectangle: DrawingComponentType, Movable, Selectable, Equatable {
    let identifier: UUID
    let width: Float
    let height: Float
    var center: RelativePoint
    var isSelected: Bool = false
    
    static func generateRandomRelativePoint() -> RelativePoint {
        let randomX = Float.random(in: 0...1)
        let randomY = Float.random(in: 0...1)
        return RelativePoint(xRatio: randomX, yRatio: randomY)!
    }
    
    init(id: UUID = UUID(), width: Float, height: Float, center: RelativePoint = Self.generateRandomRelativePoint()) {
        self.identifier = id
        self.width = width
        self.height = height
        self.center = center
    }
    
    mutating func move(to point: RelativePoint) {
        self.center = point
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}

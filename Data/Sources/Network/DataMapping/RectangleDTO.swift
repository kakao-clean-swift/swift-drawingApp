import Foundation
import UIKit
import Entity
import Util

struct RectangleDTO: Codable {
    let id: UUID
    let colorHex: String
    let points: [CGPoint]
}

extension Rectangle {
    
    func toDTO() -> RectangleDTO {
        return RectangleDTO(id: self.id, colorHex: self.color.hex, points: self.points)
    }
}

extension RectangleDTO {
    
    func toEntity() -> Rectangle {
        return Rectangle(id: self.id, color: UIColor(hex: self.colorHex) ?? UIColor(), points: self.points)
    }
}

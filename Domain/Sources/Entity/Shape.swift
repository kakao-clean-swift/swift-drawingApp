import Foundation
import UIKit
import Util

protocol Shape: Identifiable {
    var color: UIColor { get }
    var points: [CGPoint] { get }
    var isSelectable: Bool { get }
}

struct Rectangle: Shape, Codable {
    
    let id: UUID
    let color: UIColor
    let points: [CGPoint]
    let isSelectable: Bool = true
    
    enum CodingKeys: String, CodingKey {
        case id
        case colorHex
        case points
    }

    init(screenRect: CGRect,
         size: CGFloat = 100.0) {
        self.id = UUID()
        self.color = RandomColorGenerator.color()
        self.points = RandomPointsGenerator.rectangePoints(screenRect: screenRect, size: size)
    }
    
    // 이 로직을 여기서 빼고 Codable을 채택하는 DTO 를 따로 만들 지 고민중..
    // 그렇다면 DTO -> Entity 는 extension으로 할 것인가.. DataMapper 라는 객체를 둘 것인가.. 
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        
        let colorHex = try container.decode(String.self, forKey: .colorHex)
        self.color = UIColor(hex: colorHex) ?? UIColor()
        
        self.points = try container.decode([CGPoint].self, forKey: .points)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.color.hex, forKey: .colorHex)
        try container.encode(self.points, forKey: .points)
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

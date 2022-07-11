//
//  Shape.swift
//  swift-drawingapp
//
//  Created by bean Milky on 2022/07/04.
//

import Foundation

struct Point: Equatable, Codable {
    let x: Double
    let y: Double
    
    func distance(from: Point) -> Double {
        return sqrt(pow((x-from.x), 2) + pow((y-from.y), 2))
    }
}

protocol Shape: Codable {
    var id: UUID { get }
    static var countOfPoints: Int { get }
    var points: [Point] { get set }
    var width: Double { get }
    var height: Double { get }
    var data: Data? { get }
    init(points: [Point])
}

struct Rectangle: Shape, Equatable {
    
    let id: UUID
    var data: Data? {
        return try? JSONEncoder().encode(self)
    }
    public internal(set) var points: [Point] = []
    
    init(points: [Point]) {
        self.points = points
        self.id = UUID()
    }
    
    var width: Double {
        return maxX - minX
    }
    
    var height: Double {
        return maxY - minY
    }
    
    private var minX: Double {
        return points.map { $0.x }.min()!
    }
    
    private var minY: Double {
        return points.map { $0.y }.min()!
    }
    
    private var maxX: Double {
        return points.map { $0.x }.max()!
    }
    
    private var maxY: Double {
        return points.map { $0.y }.max()!
    }
    
    static func == (lhs: Rectangle, rhs: Rectangle) -> Bool {
        return lhs.points == rhs.points
    }
    
    static var countOfPoints: Int {
        return 4
    }
    
}

extension Rectangle: Codable {
    
    enum CodingKeys: String, CodingKey {
        case id
        case points
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        id = try values.decode(UUID.self, forKey: .id)
        points = try values.decode([Point].self, forKey: .points)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(points, forKey: .points)
    }
}

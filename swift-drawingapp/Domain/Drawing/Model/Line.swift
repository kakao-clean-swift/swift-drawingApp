import Foundation

struct Line: DrawingComponentType, Equatable {
    let identifier: UUID
    var paths: [RelativePoint]
    
    init(id: UUID = UUID(), paths: [RelativePoint]) {
        self.identifier = id
        self.paths = paths
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}

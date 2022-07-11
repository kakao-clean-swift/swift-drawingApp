import Foundation

protocol DrawingComponentType {
    var identifier: UUID { get }
}

extension DrawingComponentType {
    func isEqual(to drawingComponentType: DrawingComponentType) -> Bool {
        return self.identifier == drawingComponentType.identifier
    }
}

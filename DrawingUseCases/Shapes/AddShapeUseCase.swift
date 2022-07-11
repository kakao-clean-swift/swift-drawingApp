import UIKit
import Foundation
import DrawingShapes

public final class AddShapeUseCase {
    
    private var stores: [Storage] = []
    
    public init() {}
    
    @discardableResult
    public func addRectangle(stroke: UIColor, frame: CGRect) async throws -> Rectangle {
        Rectangle(stroke: stroke, frame: frame)
    }
    
    public func insert(store: Storage) {
        self.stores.append(store)
    }
}

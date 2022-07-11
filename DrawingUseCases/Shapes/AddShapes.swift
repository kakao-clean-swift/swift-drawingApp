import UIKit
import Foundation
import DrawingShapes

public struct AddShapes {
    public init() {}
    
    public func addRectangle(stroke: UIColor, frame: CGRect) async throws -> Rectangle {
        Rectangle(stroke: stroke, frame: frame)
    }
}

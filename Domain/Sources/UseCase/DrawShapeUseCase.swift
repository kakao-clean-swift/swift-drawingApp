import Foundation
import Entity
import UIKit

protocol RectangleUseCase {
    func addRandomRectangle(in screenRect: CGRect) -> Rectangle
}

protocol LineDrawingUseCase {
    func addLineDrawing(with initialPoint: CGPoint) -> LineDrawing
}

typealias DrawShapeUseCase = RectangleUseCase & LineDrawingUseCase

class DrawShapeUseCaseImpl: DrawShapeUseCase {

    let repository: LocalRepository
    
    public init(repository: LocalRepository) {
        self.repository = repository
    }
    
    func addRandomRectangle(in screenRect: CGRect) -> Rectangle {
        let rectangle = Rectangle(screenRect: screenRect)
        repository.saveShape(rectangle)
        return rectangle
    }
    
    func addLineDrawing(with initialPoint: CGPoint) -> LineDrawing {
        let lineDrawing = LineDrawing(initialPoint: initialPoint)
        repository.saveShape(lineDrawing)
        return lineDrawing
    }
}

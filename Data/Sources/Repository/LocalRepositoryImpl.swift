import Foundation
import UIKit
import Entity
import UseCase

class LocalRepositoryImpl: LocalRepository {
    private(set) var shapes: [Shape] = []
    
    func saveShape(_ shape: Shape) {
        if let index = shapes.firstIndex(where: { $0.id == shape.id }) {
            shapes.remove(at: index)
            shapes.append(shape)
        } else {
            shapes.append(shape)
        }
    }
}

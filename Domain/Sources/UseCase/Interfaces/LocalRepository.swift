import Foundation
import UIKit
import Entity

public protocol LocalRepository {
    func saveShape(_ shape: Shape)
}

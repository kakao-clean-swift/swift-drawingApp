import Foundation
import UIKit
import Entity

protocol LocalRepository {
    func saveShape(_ shape: Shape)
    func addPoint(_ point: CGPoint, to shape: Shape)
}

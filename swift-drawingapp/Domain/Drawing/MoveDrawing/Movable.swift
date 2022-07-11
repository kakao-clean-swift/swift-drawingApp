import Foundation

protocol Movable: DrawingComponentType{
    var center: RelativePoint { get }
    
    mutating func move(to point: RelativePoint)
}

import Foundation
import UIKit

public struct RandomPointsGenerator {
    public static func rectangePoints(screenRect: CGRect, size: CGFloat) -> [CGPoint] {
        guard screenRect.minX >= 0 && screenRect.maxX - size >= 0 else { return [] }
        guard screenRect.minY >= 0 && screenRect.maxY - size >= 0 else { return [] }
        
        let topLeft: CGPoint = {
            let xRange = screenRect.minX...(screenRect.maxX - size)
            let yRange = screenRect.minY...(screenRect.maxY - size)
            
            return CGPoint(x: CGFloat.random(in: xRange),
                          y: CGFloat.random(in: yRange))
        }()
        
        let topRight = topLeft.moveX(size)
        let bottomLeft = topLeft.moveY(size)
        let bottmRight = bottomLeft.moveX(size)
        return [topLeft, topRight, bottomLeft, bottmRight]
    }
}

private extension CGPoint {
    
    func moveX(_ x: CGFloat) -> CGPoint {
        return CGPoint(x: self.x + x, y: self.y)
    }
    
    func moveY(_ y: CGFloat) -> CGPoint {
        return CGPoint(x: self.x, y: self.y + y)
    }
}

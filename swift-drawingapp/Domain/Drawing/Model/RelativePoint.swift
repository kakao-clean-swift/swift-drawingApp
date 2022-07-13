import Foundation

struct RelativePoint: Equatable {
    let xRatio: Float
    let yRatio: Float
    
    init?(xRatio: Float, yRatio: Float) {
        if xRatio < 0 || yRatio > 1 {
            return nil
        }
        self.xRatio = xRatio
        self.yRatio = yRatio
    }
    
    
    
    func absoulutePoint(canvasWidth: Float, canvasHeight: Float) -> (x: Float, y: Float) {
        return (x: xRatio * canvasWidth ,y: yRatio * canvasHeight)
    }
}

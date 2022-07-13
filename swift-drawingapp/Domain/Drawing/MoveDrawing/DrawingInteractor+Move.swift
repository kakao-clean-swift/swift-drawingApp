import Foundation

protocol MoveDrawingBusinessLogic {
    func move(id: UUID, to point: RelativePoint)
}

extension DrawingInteractor: MoveDrawingBusinessLogic {
    
    func move(id: UUID, to point: RelativePoint) {
        guard let moved = self.canvas.moveItem(id: id, to: point) else {
            return
        }
        self.presenter.presentMovedDrawing(item: moved)
    }
    
}

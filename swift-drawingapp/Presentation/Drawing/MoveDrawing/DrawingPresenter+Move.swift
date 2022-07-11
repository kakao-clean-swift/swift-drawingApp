import UIKit

protocol MoveDrawingPresentationLogic {
    func presentMovedDrawing(item: Movable)
}

extension DrawingPresenter: MoveDrawingPresentationLogic {
    func presentMovedDrawing(item: Movable) {
        self.viewController?.displayMoveDrawing(viewModel: Drawing.MovableViewModel(movable: item))
    }
}

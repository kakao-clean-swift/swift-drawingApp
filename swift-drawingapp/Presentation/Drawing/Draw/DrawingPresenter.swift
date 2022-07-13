import UIKit

protocol DrawDrawingPresentationLogic {
    func presentDraw(drawComponentType: DrawingComponentType)
}

class DrawingPresenter: DrawDrawingPresentationLogic {
    
    typealias DrawingDisplayLogic = (DrawDrawingDisplayLogic & MoveDrawingDisplayLogic & SelectDrawingDisplayLogic & SyncDrawingDisplayLogic)
    
    weak var viewController: DrawingDisplayLogic?
        
    func presentDraw(drawComponentType: DrawingComponentType) {
        self.viewController?.displayDraw(viewModel: Drawing.ViewModel(
            drawingComponent: drawComponentType,
            color: UIColor.randomSystemColor)
        )
    }
}

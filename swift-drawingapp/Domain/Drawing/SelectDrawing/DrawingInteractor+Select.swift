import Foundation

protocol SelectDrawingBusinessLogic {
    func select(id: UUID, isSelected: Bool)
}

extension DrawingInteractor: SelectDrawingBusinessLogic {
    func select(id: UUID, isSelected: Bool) {
        let selected = self.canvas.select(id: id, isSelected: isSelected)

        self.presenter.presentSelectedDrawing(item: selected)
    }
}

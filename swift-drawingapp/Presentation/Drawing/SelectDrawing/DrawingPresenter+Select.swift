import Foundation

protocol SelectDrawingPresentationLogic {
    func presentSelectedDrawing(item: Selectable?)
}

extension DrawingPresenter: SelectDrawingPresentationLogic {
    func presentSelectedDrawing(item: Selectable?) {
        self.viewController?.displaySelectedItem(
            viewModel: Drawing.SelectableViewModel(selctable: item)
        )
    }
}

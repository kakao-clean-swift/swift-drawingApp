//
//  MainViewModel.swift
//  swift-drawingapp
//
//  Created by 윤준수 on 2022/07/11.
//

import Combine
import UIKit

final class MainViewModel {
    private(set) var rectangleUsecase: DrawRectangleUsecase!
    private var syncUsecase: SyncUsecase
    
    private var rectangles: [RectangleViewModel] = []
    @Published var rectanglesToDraw: [RectangleViewModel] = []
    
    init(syncUsecase: SyncUsecase) {
        self.syncUsecase = syncUsecase
    }
    
    func setDrawRectangleUsecase(_ usecase: DrawRectangleUsecase) {
        self.rectangleUsecase = usecase
    }
    
    func didTapClearButton() {
        rectangles.removeAll()
    }
}

// MARK: DrawRectangleUsecase

extension MainViewModel {
    func didTapDrawRectangleButton() {
        let rectangleModel = rectangleUsecase.drawRectangle()
        let rectangleViewModel = Mapper.getRectangleViewModel(model: rectangleModel, isSelectable: true)
        rectangles.append(rectangleViewModel)
        rectanglesToDraw = [rectangleViewModel]
    }
}

// MARK: SyncUsecase

extension MainViewModel {
    func didTapSyncButton() {
        syncUsecase.login()
        
//        syncUsecase.chat() //Mapping
    }
}

struct Mapper {
    static func getRectangleViewModel(model: RectangleModel, isSelectable: Bool) -> RectangleViewModel {
        return RectangleViewModel(origin: CGPoint(x: model.origin.x, y: model.origin.y),
                           size: CGSize(width: model.size.width, height: model.size.height),
                           color: UIColor(red: model.color.red, green: model.color.green, blue: model.color.blue, alpha: 1),
                           isSelectable: isSelectable)
    }
}

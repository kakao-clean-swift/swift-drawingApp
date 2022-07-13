//
//  DrawingViewModel.swift
//  swift-drawingapp
//
//  Created by fran on 2022/07/04.
//

import UIKit
import Combine

class DrawingViewModel {
    @Published var drawableItems: [DrawingObject] = []
    
    var currentDrawing: DrawingObject?
    
    public let startDrawingEvent = PassthroughSubject<ItemDrawable, Never>()  
    public let endDrawingEvent = PassthroughSubject<ItemDrawable, Never>()
    public let refreshItems = PassthroughSubject<[ItemDrawable], Never>()
        
    var visibleRect: CGRect = .zero
    
    // input
    func didTapManualDrawingButton() {                
        didTapDrawing(type: .manual)
    }
    
    func didEndManualDrawing(color: UIColor, points: [CGPoint]) {
        endDrawing(type: .manual, points: points.map { Point(x: Float($0.x), y: Float($0.y)) })      
    }
    
    func didTapSquareButton() {
        didTapDrawing(type: .square)
    }
    
    func didTapSyncButton() {
        
    }
    
    func didSelectItem(_ item: ItemDrawable) {
        guard let item = didSelect(item: item) else { return }        
        drawSelect(item: item)
    }
}

// MARK: - CreateDrawingUseCase
extension DrawingViewModel: CreateDrawingUseCase {    
    func didTapDrawing(type: DrawingObjectType) {
        startDrawing(type: type)     
    }
    
    func startDrawing(type: DrawingObjectType) {
        let color = randomSystemColor()
        currentDrawing = DrawingObject(type: type, color: color)
        
        // manual - 추가 입력을 받는다. 
        startDrawingEvent.send(currentDrawing!)
        
        // square - 추가 입력을 안받고 바로 그린다.       
        if type == .square {            
            let startPoint = randomPoint()
            let fixedLength = currentDrawing?.fixedLength ?? 0
            let points = [startPoint, Point(x: startPoint.x + fixedLength, y: startPoint.y + fixedLength)]
            
            endDrawing(type: type, points: points)
        }
    }
    
    func endDrawing(type: DrawingObjectType, points: [Point]) {
        guard let currentDrawing = currentDrawing, currentDrawing.type == type else { return }      
        
        currentDrawing.points = points        
        drawableItems.append(currentDrawing)
        self.currentDrawing = nil
        
        endDrawingEvent.send(currentDrawing)
    }
}

// MARK: - SelectDrawingUseCase
extension DrawingViewModel: SelectDrawingUseCase {
    func didSelect(item: ItemDrawable) -> DrawingObject? {
        guard let item = item as? DrawingObject, drawableItems.contains(item) else { return nil }
        return item        
    }
    
    func drawSelect(item: DrawingObject) {
        item.isSelected = !item.isSelected
        refreshItems.send(drawableItems)        
    }
}

// MARK: - Misc
extension DrawingViewModel {
    private func randomSystemColor() -> UIColor {
        let colors: [UIColor] = [.systemPink, .systemBlue, .systemBlue, .systemCyan, .systemFill, .systemGray, .systemMint, .systemTeal, .systemBrown, .systemGray2, .systemGreen, .systemIndigo, .systemOrange, .systemPurple, .systemYellow]
        return colors.randomElement() ?? .systemGray
    }

    private func randomPoint() -> Point {
        let x = Float(arc4random_uniform(UInt32(visibleRect.width)))
        let y = Float(arc4random_uniform(UInt32(visibleRect.height)))
        return Point(x: x, y: y)
    }
}

//
//  DrawManager.swift
//  swift-drawingapp
//
//  Created by Hochang Lee on 2022/07/04.
//

import UIKit

protocol DrawManagable: AnyObject {
    func addRect()
    func startDraw(at point: CGPoint)
    func continueDraw(at point: CGPoint)
    func endDraw(at point: CGPoint)
    
    var delegate: DrawManagerDelegate? { get set }
}

protocol DrawManagerDelegate: AnyObject {
    func drawRect(rectViewModel: RectangleViewModel)
    func drawLine(from: CGPoint, to: CGPoint)
}

class DrawManager: DrawManagable {
    private let paperWidth: Float
    private let paperHeight: Float
    
    private let figureDrawable: FigureDrawable
    private let pathDrawable: PathDrawable
    
    private var figures = [DrawingIdentifiable]()
    private var drawings = [Drawing]()
    
    weak var delegate: DrawManagerDelegate?
    
    init(figureDrawable: FigureDrawable, pathDrawable: PathDrawable, paperWidth: Float, paperHeight: Float) {
        self.figureDrawable = figureDrawable
        self.pathDrawable = pathDrawable
        self.paperWidth = paperWidth
        self.paperHeight = paperHeight
    }
    
    // MARK: - Rectangle
    
    func addRect() {
        let x = Float.random(in: 0...paperWidth)
        let y = Float.random(in: 0...paperHeight)

        let point = Point(x: x, y: y)
        if figureDrawable.canDraw(at: point) {
            let figurable = figureDrawable.draw(at: point)
            if let rect = figurable as? Rectangle {
                let viewModel = RectangleViewModel(rectangle: rect, canSenect: true)
                figures.append(viewModel)
                delegate?.drawRect(rectViewModel: viewModel)
            }
        } else {
            addRect()
        }
    }
    
    func startDraw(at point: CGPoint) {
        
    }
    
    func continueDraw(at point: CGPoint) {
        
    }
    
    func endDraw(at point: CGPoint) {
        
    }

}

//
//  DrawManager.swift
//  swift-drawingapp
//
//  Created by Hochang Lee on 2022/07/04.
//

import UIKit

protocol DrawManagable: AnyObject {
    func addRect(at point: CGPoint)
    func startDraw(at point: CGPoint)
    func continueDraw(at point: CGPoint)
    func endDraw(at point: CGPoint)
    
    var delegate: DrawManagerDelegate? { get set }
}

protocol DrawManagerDelegate: AnyObject {
    func drawRect(rect: CGRect)
    func drawLine(from: CGPoint, to: CGPoint)
}

class DrawManager: DrawManagable {
    let figureDrawable: FigureDrawable
    let pathDrawable: PathDrawable
    
    weak var delegate: DrawManagerDelegate?
    
    init(figureDrawable: FigureDrawable, pathDrawable: PathDrawable) {
        self.figureDrawable = figureDrawable
        self.pathDrawable = pathDrawable
    }
    
    func addRect(at point: CGPoint) {
        
    }
    
    func startDraw(at point: CGPoint) {
        
    }
    
    func continueDraw(at point: CGPoint) {
        
    }
    
    func endDraw(at point: CGPoint) {
        
    }

}

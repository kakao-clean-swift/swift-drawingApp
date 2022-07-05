//
//  ViewController.swift
//  swift-drawingapp
//
//  Created by JK on 2022/07/04.
//

import UIKit

class ViewController: UIViewController {
    weak var drawManager: DrawManagable?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let width = Float(view.frame.width)
        let height = Float(view.frame.height)
        let rectangleWidth: Float = 100
        let rectangleHeight: Float = 100
        
        // ToDo:: - figureDrawable, pathDrawable Factory로 만들기?
        let figureDrawable = RectangleDraw(width: rectangleWidth, height: rectangleHeight, paperWidth: width, paperHeight: height)
        let pathDrawable = PathDraw(paperWidth: width, paperHeight: height)
        
        let drawManager = DrawManager(figureDrawable: figureDrawable, pathDrawable: pathDrawable)
        drawManager.delegate = self
        self.drawManager = drawManager
    }
}

extension ViewController: DrawManagerDelegate {
    func drawRect(rect: CGRect) {
        // UI
    }
    
    func drawLine(from: CGPoint, to: CGPoint) {
        // UI
    }
}

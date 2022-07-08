//
//  ViewController.swift
//  swift-drawingapp
//
//  Created by JK on 2022/07/04.
//

import UIKit

class ViewController: UIViewController {
    var drawManager: DrawManagable?
    
    var rectangles = [UIView: RectangleViewModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        let width = Float(view.frame.width)
        let height = Float(view.frame.height)
        
        let figureDrawable = FigureDrawableFactory.getFigureDrawable(paperWidth: width, paperHeight: height)
        let pathDrawable = PathDrawableFactory.getPathDrawable(paperWidth: width, paperHeight: height)
        
        let drawManager = DrawManager(figureDrawable: figureDrawable, pathDrawable: pathDrawable, paperWidth: width, paperHeight: height)
        drawManager.delegate = self
        self.drawManager = drawManager
    }
    
    @IBAction func didTouchRectangle(_ sender: Any) {
        drawManager?.addRect()
    }
    
    @IBAction func didTouchDrawing(_ sender: Any) {
    }
    
    @IBAction func didTouchSync(_ sender: Any) {
    }
}

extension ViewController: DrawManagerDelegate {
    func drawRect(rectViewModel: RectangleViewModel) {
        let rectView = UIView(rect: rectViewModel.rectangle)
        rectView.backgroundColor = .green
        
        view.addSubview(rectView)
        rectangles[rectView] = rectViewModel
    }
    
    func drawLine(from: CGPoint, to: CGPoint) {
        // UI
    }
}

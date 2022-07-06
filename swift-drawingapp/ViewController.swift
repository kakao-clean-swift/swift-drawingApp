//
//  ViewController.swift
//  swift-drawingapp
//
//  Created by JK on 2022/07/04.
//

import UIKit

protocol ViewDelegate: AnyObject {
    func viewRefresh(drawObjects: [DrawObject])
}

class ViewController: UIViewController {
    var drawManager = DrawManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawManager.delegate = self
    }

    @IBAction func rectangleButton(_ sender: Any) {
        drawManager.drawRectangle()
    }
    
    @IBAction func drawButton(_ sender: Any) {
    }
    
    @IBAction func syncButton(_ sender: Any) {
    }
    
    private func clearBoard() {
        view.subviews
            .forEach { view in
                guard !(view is UIStackView) else {
                    return
                }
                
                view.removeFromSuperview()
            }
    }
}

extension ViewController: ViewDelegate {
    func viewRefresh(drawObjects: [DrawObject]) {
        clearBoard()
        drawObjects
            .forEach { [weak self] drawObject in
                let uiView = drawObject.uiView
                self?.view.addSubview(uiView)
            }
    }
}

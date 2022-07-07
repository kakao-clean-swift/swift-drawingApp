//
//  ViewController.swift
//  swift-drawingapp
//
//  Created by JK on 2022/07/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var canvasView: CanvasView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func onTouchRectBtn(_ sender: Any) {
        canvasView.addRectangle(RectangleFactory.rectangleMy())
    }
    
    @IBAction func onTouchLineBtn(_ sender: Any) {
        canvasView.setLineInputMode()
        
    }
    
    @IBAction func onTouchSyncBtn(_ sender: Any) {
    }
}


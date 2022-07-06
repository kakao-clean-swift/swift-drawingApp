//
//  ViewController.swift
//  swift-drawingapp
//
//  Created by JK on 2022/07/04.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var drawingScreen: DrawingScreen!

    @IBAction func drawSquare(_ sender: UIButton) {
        drawingScreen.addSquareViewForRandom()
        drawingScreen.enableDrawingLine = false
    }

    @IBAction func drawLine(_ sender: UIButton) {
        drawingScreen.enableDrawingLine = true
    }

    @IBAction func startSync(_ sender: UIButton) {
        do {
            try drawingSyncManager.startSync(shapes: drawingScreen.shapes)
        } catch SyncError.notLogin {
            print("로그인 아이디 입력화면 출력.")
        } catch {
            print(error.localizedDescription)
        }
    }

    private let drawingSyncManager = DrawingSyncManager()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


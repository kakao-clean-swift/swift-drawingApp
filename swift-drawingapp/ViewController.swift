//
//  ViewController.swift
//  swift-drawingapp
//
//  Created by JK on 2022/07/04.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak private var drawingScreen: DrawingScreen!

    @IBAction func drawSquare(_ sender: UIButton) {
        drawingScreen.addView(shape: Square(center: drawingScreen.randomPosition, size: SquareView.size))
        drawingScreen.enableDrawingLine = false
    }

    @IBAction func drawLine(_ sender: UIButton) {
        drawingScreen.enableDrawingLine = true
    }

    @IBAction func startSync(_ sender: UIButton) {
        drawingScreen.shapes.compactMap({ $0.data }).forEach { localChatServer.sendData($0) }
    }

    private var localChatServer: DrawingUseCase!

    override func viewDidLoad() {
        super.viewDidLoad()
        localChatServer = DrawingLocalChatServerUseCase(delegate: self)
        drawingScreen.padding = UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50)
        drawingScreen.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(drawLine(gesture:))))
    }

    @objc private func drawLine(gesture: UIPanGestureRecognizer) {
        drawingScreen.drawLine(gesture: gesture)
    }
}

extension ViewController: DrawingLocalChatServerDelegate {
    func drawingLocalChatServer(didFail error: Error) {
        if case SyncError.notLogin = error {
            print("로그인 아이디 입력화면 출력.")
        }
    }
}


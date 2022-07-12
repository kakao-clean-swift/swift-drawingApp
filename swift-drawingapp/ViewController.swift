//
//  ViewController.swift
//  swift-drawingapp
//
//  Created by JK on 2022/07/04.
//

import UIKit
import Combine

protocol DrawingPresenter {
    var loginState: PassthroughSubject<Bool, Never> { get set }
    var receivedShape: PassthroughSubject<Data, Never> { get set }
}

class ViewController: UIViewController, DrawingPresenter {
    @IBOutlet weak private var drawingScreen: DrawingScreen!

    @IBAction func drawSquare(_ sender: UIButton) {
        drawingScreen.addView(shape: Square(center: drawingScreen.randomPosition, size: SquareView.size))
        drawingScreen.enableDrawingLine = false
    }

    @IBAction func drawLine(_ sender: UIButton) {
        drawingScreen.enableDrawingLine = true
    }

    @IBAction func startSync(_ sender: UIButton) {
        do {
            try localServer.sendShapes(drawingScreen.shapes)
        } catch {
            if case DrawingLocalServerError.notLogin = error {
                showLoginAlert()
            } else if case DrawingLocalServerError.emptyScreen = error {
                showAlert(text: "도형을 추가해주세요.")
            }
        }
    }

    private var cancellables = Set<AnyCancellable>()
    private var localServer: DrawingUseCase!

    var loginState = PassthroughSubject<Bool, Never>()
    var receivedShape = PassthroughSubject<Data, Never>()

    override func viewDidLoad() {
        super.viewDidLoad()
        receivedShape.sink(receiveValue: { data in
            guard let shape = try? JSONDecoder().decode(Shape.self, from: data) else { return }

            self.drawingScreen.addView(shape: shape)
        }).store(in: &cancellables)

        loginState.sink(receiveValue: { isLogin in
            let text = isLogin ? "로그인 성공" : "로그인 실패"

            self.showAlert(text: text)
        }).store(in: &cancellables)

        localServer = DrawingLocalServerUseCase(presenter: self)
        drawingScreen.padding = UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50)
        drawingScreen.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(drawLine(gesture:))))
    }

    @objc private func drawLine(gesture: UIPanGestureRecognizer) {
        drawingScreen.drawLine(gesture: gesture)
    }

    private func showLoginAlert() {
        let alert = UIAlertController(title: "ID 입력", message: nil, preferredStyle: .alert)
        alert.addTextField()
        alert.addAction(UIAlertAction(title: "취소", style: .cancel))
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { _ in
            guard let id = alert.textFields?[0].text else { return }

            self.localServer.login(id: id)
        }))
        self.present(alert, animated: true)
    }

    private func showAlert(text: String) {
        let alert = UIAlertController(title: nil, message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        present(alert, animated: true)
    }
}


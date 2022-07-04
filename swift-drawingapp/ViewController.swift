//
//  ViewController.swift
//  swift-drawingapp
//
//  Created by JK on 2022/07/04.
//

import UIKit

class ViewController: UIViewController {

    private var buttonStackView: UIStackView = {
        let stackView: UIStackView = UIStackView(frame: .zero)
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private var squareButton: UIButton = {
        let button: UIButton = UIButton(frame: .zero)
        button.setTitle("사각형", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(didSelectSquareButton(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var drawingButton: UIButton = {
        let button: UIButton = UIButton(frame: .zero)
        button.setTitle("드로잉", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var syncButton: UIButton = {
        let button: UIButton = UIButton(frame: .zero)
        button.setTitle("동기화", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var canvasView: UIView = {
        let view: UIView = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var canvasManager: CanvasManager = CanvasManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }

    private func setupLayout() {
        view.addSubview(buttonStackView)
        view.addSubview(canvasView)
        buttonStackView.addArrangedSubview(squareButton)
        buttonStackView.addArrangedSubview(drawingButton)
        buttonStackView.addArrangedSubview(syncButton)

        NSLayoutConstraint.activate([
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),

            canvasView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            canvasView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            canvasView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            canvasView.bottomAnchor.constraint(equalTo: buttonStackView.topAnchor)
        ])
    }

    @objc func didSelectSquareButton(_ sender: UIButton) {
        canvasManager.drawSquare(in: canvasView)
    }
}


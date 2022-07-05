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
        button.addTarget(self, action: #selector(didSelectDrawingButton(_:)), for: .touchUpInside)
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

    private var contentView: UIView = {
        let view: UIView = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var canvasManager: CanvasManager = CanvasManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }

    override func viewDidAppear(_ animated: Bool) {
        canvasManager.start(in: contentView)
    }

    private func setupLayout() {
        view.addSubview(buttonStackView)
        view.addSubview(contentView)
        buttonStackView.addArrangedSubview(squareButton)
        buttonStackView.addArrangedSubview(drawingButton)
        buttonStackView.addArrangedSubview(syncButton)

        NSLayoutConstraint.activate([
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),

            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: buttonStackView.topAnchor)
        ])
    }

    @objc func didSelectSquareButton(_ sender: UIButton) {
        canvasManager.drawSquare()
    }

    @objc func didSelectDrawingButton(_ sender: UIButton) {
        canvasManager.startDrawing()
    }
}


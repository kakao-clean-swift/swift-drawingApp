//
//  ViewController.swift
//  swift-drawingapp
//
//  Created by JK on 2022/07/04.
//

import Combine
import UIKit

import SnapKit

class ViewController: UIViewController {
    
    private var subscriptions = Set<AnyCancellable>()
    private var views = [UUID: UIView]()
    private var figureCount = 0

    private let rectButton: UIButton = {
        let button = UIButton()
        button.setTitle("사각형", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(pressRectButton), for: .touchUpInside)
        return button
    }()
    
    private let drawingButton: UIButton = {
        let button = UIButton()
        button.setTitle("드로잉", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(pressDrawingButton), for: .touchUpInside)
        return button
    }()
    
    private let syncButton: UIButton = {
        let button = UIButton()
        button.setTitle("동기화", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(pressSyncButton), for: .touchUpInside)
        return button
    }()
    
    private var viewModel = DrawingViewModel()
    
    override func loadView() {
        super.loadView()
        
        view.addSubview(rectButton)
        view.addSubview(drawingButton)
        view.addSubview(syncButton)
       
        rectButton.snp.makeConstraints {
            $0.width.equalTo(100)
            $0.height.equalTo(50)
            $0.trailing.equalTo(drawingButton.snp.leading)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        drawingButton.snp.makeConstraints {
            $0.width.equalTo(100)
            $0.height.equalTo(50)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        syncButton.snp.makeConstraints {
            $0.width.equalTo(100)
            $0.height.equalTo(50)
            $0.leading.equalTo(drawingButton.snp.trailing)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setViewModel()
    }
    
    private func setViewModel() {
        viewModel.$rects
            .sink { [weak self] rects in
                guard let rect = rects.last else { return }
                
                let rectView = RectView(rect)
                self?.observeTouch(rectView)
                self?.views[rect.id] = rectView
                self?.view.addSubview(rectView)
                self?.setAccessibilityIdentifier(rectView)
            }
            .store(in: &subscriptions)
        
        viewModel.$selectedId
            .sink { [weak self] id in
                guard let id = id else { return }
                (self?.views[id] as? RectView)?.selected()
            }
            .store(in: &subscriptions)
        
        viewModel.$deselectedId
            .sink { [weak self] id in
                guard let id = id else { return }
                (self?.views[id] as? RectView)?.deselected()
            }
            .store(in: &subscriptions)
    }
    
    private func observeTouch(_ rectView: RectView) {
        rectView.$touched
            .sink { [weak self] id in
                self?.viewModel.touched(id)
            }
            .store(in: &subscriptions)
    }
    
    @objc
    private func pressRectButton() {
        viewModel.createRect()
    }
    
    @objc
    private func pressDrawingButton() {
        
    }
    
    @objc
    private func pressSyncButton() {
        
    }
    
    /// UITest를 위한 코드
    private func setAccessibilityIdentifier(_ view: UIView) {
        figureCount += 1
        view.accessibilityIdentifier = "view\(figureCount)"
    }
}


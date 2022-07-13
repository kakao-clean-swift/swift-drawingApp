//
//  DrawBottomView.swift
//  swift-drawingapp
//
//  Created by bean Milky on 2022/07/04.
//

import Foundation
import UIKit
import SnapKit

class DrawBottomView: UIView {
    
    var didTapLeft: (() -> Void)?
    var didTapCenter: (() -> Void)?
    var didTapRight: (() -> Void)?

    private let leftButton: UIButton = {
        let button = DrawBottomButton()
        button.setTitle("사각형", for: .normal)
        return button
    }()
    
    private let centerButton: UIButton = {
        let button = DrawBottomButton()
        button.setTitle("드로잉", for: .normal)
        return button
    }()
    
    private let rightButton: UIButton = {
        let button = DrawBottomButton()
        button.setTitle("동기화", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        initView()
    }
    
    private func initView() {
        addSubview(leftButton)
        addSubview(centerButton)
        addSubview(rightButton)
        
        centerButton.snp.makeConstraints { make in
            make.width.height.equalTo(50)
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        leftButton.snp.makeConstraints { make in
            make.width.height.equalTo(50)
            make.bottom.equalToSuperview()
            make.right.equalTo(centerButton.snp.left)
        }
        
        rightButton.snp.makeConstraints { make in
            make.width.height.equalTo(50)
            make.bottom.equalToSuperview()
            make.left.equalTo(centerButton.snp.right)
        }
        
        leftButton.addTarget(self, action: #selector(didTapLeft(_:)), for: .touchUpInside)
        centerButton.addTarget(self, action: #selector(didTapCenter(_:)), for: .touchUpInside)
    }
    
    @objc
    private func didTapLeft(_ sender: UIButton) {
        didTapLeft?()
    }
    
    @objc
    private func didTapCenter(_ sender: UIButton) {
        didTapCenter?()
    }
}

private class DrawBottomButton: UIButton {
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
        self.setTitleColor(.black, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

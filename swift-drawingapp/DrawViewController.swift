//
//  ViewController.swift
//  swift-drawingapp
//
//  Created by JK on 2022/07/04.
//

import UIKit
import SnapKit

class DrawViewController: UIViewController {

    let bottomView = DrawBottomView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        NSLog("DrawViewController - viewDidLoad")
    }
    
    private func initView() {
        view.addSubview(bottomView)
        
        bottomView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(100)
        }
    }

}


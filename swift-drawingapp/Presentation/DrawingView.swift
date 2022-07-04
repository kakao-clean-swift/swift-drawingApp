//
//  DrawingView.swift
//  swift-drawingapp
//
//  Created by kakao on 2022/07/04.
//

import UIKit

class DrawingView: UIView {
    var viewModel: DrawingViewModel? {
        DIContainer.shared.resolve(for: DrawingViewModel.self)
    }
}

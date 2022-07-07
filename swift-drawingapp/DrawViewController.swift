//
//  ViewController.swift
//  swift-drawingapp
//
//  Created by JK on 2022/07/04.
//

import UIKit
import SnapKit
import Combine

class DrawViewController: UIViewController {

    let bottomView = DrawBottomView(frame: .zero)
    let viewModel = DrawViewModel()
    var disposables = Set<AnyCancellable>()
    var shapeFactory: ShapeGeneratable!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        NSLog("DrawViewController - viewDidLoad")
        viewModel.planeRange = ShapeRange(minX: 0,
                                          minY: 0,
                                          maxX: view.bounds.maxY / 3.0,
                                          maxY: view.bounds.maxY / 3.0)
        shapeFactory = ShapeFactory(planeRange: viewModel.planeRange,
                                    shapeRange: ShapeRange(minX: 300, minY: 300, maxX: 600, maxY: 600))
        
        self.bind()
    }
    
    private func bind() {
        viewModel.$shapes
            .sink(receiveCompletion: { result in
            }, receiveValue: { shapes in
                shapes.forEach { shape in
                    stride(from: 0, to: shape.points.count - 1, by: 1).map {
                        (shape.points[$0], shape.points[$0+1])
                    }.forEach( {lhs, rhs in
                        self.drawLine(from: CGPoint(x: lhs.x, y: lhs.y),
                                      to: CGPoint(x: rhs.x, y: rhs.y))
                    })
                }
            }).store(in: &disposables)
    }
    
    private func drawLine(from start: CGPoint, to end:CGPoint, color: UIColor = .black) {
        let path = UIBezierPath()
        path.move(to: start)
        path.addLine(to: end)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = 1.0

        view.layer.addSublayer(shapeLayer)
     }
    
    private func initView() {
        view.addSubview(bottomView)
        
        bottomView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(100)
        }
        
        bottomView.didTapLeft = { [weak self] in
            guard let self = self else { return }
            self.viewModel.shapes.append(self.shapeFactory.build(type: Rectangle.self)!)
        }
    }

}


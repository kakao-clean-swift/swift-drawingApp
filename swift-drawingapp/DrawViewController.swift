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
        viewModel.shapeRange = ShapeRange(minX: 0,
                                          minY: 0,
                                          maxX: 100,
                                          maxY: 100)
        shapeFactory = ShapeFactory(range: viewModel.shapeRange)
        
        self.bind()
        
        viewModel.shapes.append(shapeFactory.build(type: Rectangle.self)!)
    }
    
    private func bind() {
        viewModel.$shapes
            .sink(receiveCompletion: { result in
            }, receiveValue: { shapes in
                shapes.forEach { shape in
                    stride(from: 0, to: shape.points.count - 1, by: 2).map {
                        (shape.points[$0], shape.points[$0+1])
                    }.forEach( {lhs, rhs in
                        self.drawLine(from: CGPoint(x: lhs.x, y: lhs.y),
                                      to: CGPoint(x: rhs.x, y: rhs.y))
                    })
                }
            }).store(in: &disposables)
    }
    
    func drawLine(from start: CGPoint, to end:CGPoint, color: UIColor = .black) {
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
    }

}


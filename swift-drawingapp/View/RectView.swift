//
//  RectView.swift
//  swift-drawingapp
//
//  Created by joel.inju on 2022/07/04.
//

import UIKit

class RectView: UIView {
    private var id: UUID?
    @Published var touched: UUID?
    
    init(_ rect: Rect?) {
        super.init(frame: .zero)
        
        guard let rect = rect,
              rect.points.count == 1 else { return }
        
        self.id = rect.id
        
        let point = rect.points[0]
        self.frame = CGRect(x: point.x, y: point.y, width: 100, height: 100)
        self.backgroundColor = systemColor(rect.colorIndex)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(touchView))
        self.addGestureRecognizer(gesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    func touchView(_ sender: UIGestureRecognizer) {
        touched = id
    }
    
    func selected() {
        self.layer.borderWidth = 10
        self.layer.borderColor = UIColor.systemRed.cgColor
    }
    
    func deselected() {
        self.layer.borderColor = self.backgroundColor?.cgColor
    }
    
    func figureId() -> UUID? {
        return id
    }
}

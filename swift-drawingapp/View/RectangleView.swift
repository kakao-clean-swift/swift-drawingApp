import UIKit

protocol DrawingView: UIView {
    var identifier: UUID { get }
}

protocol SelectableView: DrawingView {
    var isSelected: Bool { get set }
}

protocol MovableView: DrawingView {
    func move(to point: CGPoint)
}

protocol RectangleViewDelegate: AnyObject {
    func didTapRectangleView(uuid: UUID, isSelected: Bool)
    func didPanRectangleView(uuid: UUID, to point: CGPoint)
}

class RectanlgeView: UIView, DrawingView, SelectableView, MovableView {
    
    let identifier: UUID
    weak var delegate: RectangleViewDelegate?
    
    var isSelected: Bool = false {
        willSet {
            if newValue {
                self.layer.borderColor = UIColor.systemRed.cgColor
                self.layer.borderWidth = 5
            } else {
                self.layer.borderWidth = 0
            }
        }
    }
    init(identifier: UUID, frame: CGRect) {
        self.identifier = identifier
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        self.identifier = UUID()
        super.init(coder: coder)
        self.setup()
    }
    
    private func setup() {
        self.backgroundColor = UIColor.randomSystemColor
        self.isUserInteractionEnabled = true
        
        let tapGesutreRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.didTapRectangleView))
        self.addGestureRecognizer(tapGesutreRecognizer)
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(self.didPanRectanlgeView))
        self.addGestureRecognizer(panGestureRecognizer)
    }
    
    @objc
    private func didTapRectangleView(_ gesture: UITapGestureRecognizer) {
        self.delegate?.didTapRectangleView(uuid: self.identifier, isSelected: !self.isSelected)
    }
    
    @objc
    private func didPanRectanlgeView(gesture: UIPanGestureRecognizer) {
        let currentPoint = gesture.location(in: self.superview)
        self.delegate?.didPanRectangleView(uuid: self.identifier, to: currentPoint)
        
    }
    
    func move(to origin: CGPoint) {
        UIView.animate(withDuration: 0.1) {
            var newFrame =  self.frame
            newFrame.origin = origin
            self.frame = newFrame
        }
    }
}


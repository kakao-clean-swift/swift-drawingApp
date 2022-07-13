import UIKit

protocol CanvasViewDelegate {
    func didTapRectangleView(uuid: UUID, isSelected: Bool)
    func didPanRectangleView(uuid: UUID, to point: RelativePoint)
}

class CanvasView: UIView {
    
    var delegate: CanvasViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func addRectangleView(with rect: Rectangle) -> Bool {
        
        guard self.canAdd(rect: rect) else { return false }
        
        let (x,y) = rect.center.absoulutePoint(
            canvasWidth: Float(self.frame.width),
            canvasHeight: Float(self.frame.width)
        )
        
        let origin = CGPoint(
            x: CGFloat(x) - CGFloat(rect.width) / 2.0,
            y: CGFloat(y) - CGFloat(rect.height) / 2.0
        )
        
        let rectView = RectanlgeView(
            identifier: rect.identifier,
            frame: CGRect(
                origin: origin,
                size: CGSize(
                    width: CGFloat(rect.width),
                    height: CGFloat(rect.height)
                )
            )
        )
        rectView.delegate = self
        self.addSubview(rectView)
        return true
    }
    
    func select(selectable: Selectable?) {
        self.subviews.forEach { view in
            let view = view as? SelectableView
            if view?.identifier == selectable?.identifier {
                view?.isSelected = true
            } else {
                view?.isSelected = false
            }
        }
    }
    
    func move(movable: Movable) {
        let movableView = self.subviews.first(where: { view in
            let view = view as? MovableView
            return view?.identifier == movable.identifier
        }) as? MovableView
        
        let (x,y) = movable.center.absoulutePoint(
            canvasWidth: Float(self.frame.width),
            canvasHeight: Float(self.frame.width)
        )
        
        movableView?.move(to: CGPoint(x: CGFloat(x), y: CGFloat(y)))
    }
    
    private func canAdd(rect: Rectangle) -> Bool {
        let (x,y) = rect.center.absoulutePoint(
            canvasWidth: Float(self.frame.width),
            canvasHeight: Float(self.frame.width)
        )
        
        let origin = CGPoint(
            x: CGFloat(x) - CGFloat(rect.width) / 2.0,
            y: CGFloat(y) - CGFloat(rect.height) / 2.0
        )
        
        let maxXY = CGPoint(
            x: CGFloat(x) + CGFloat(rect.width) / 2.0,
            y: CGFloat(y) + CGFloat(rect.height) / 2.0
        )
        
        if origin.x < 0 || origin.y < 0 || maxXY.x > self.frame.width || maxXY.y > self.frame.height {
            return false
        }
        
        return true
    }
}
 
extension CanvasView: RectangleViewDelegate {
    func didTapRectangleView(uuid: UUID, isSelected: Bool) {
        self.delegate?.didTapRectangleView(uuid: uuid, isSelected: isSelected)
    }
    
    func didPanRectangleView(uuid: UUID, to point: CGPoint) {
        let relativeX = Float(point.x / self.frame.width)
        let relativeY = Float(point.y / self.frame.height)
        guard let relativePoint = RelativePoint(xRatio: relativeX, yRatio: relativeY) else {
            return
        }
        self.delegate?.didPanRectangleView(uuid:uuid, to: relativePoint)
    }
}

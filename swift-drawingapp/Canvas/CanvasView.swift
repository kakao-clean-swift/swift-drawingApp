//
//  CanvasView.swift
//  swift-drawingapp
//
//  Created by Landon.kim on 2022/07/05.
//

import UIKit

class CanvasView: UIView {

    private var items = [ItemBase]()
    
    private var lineInputMode: Bool = false
    private var selectedItem: ItemBase?
    
    public func setLineInputMode() {
        lineInputMode = true
    }
    
    public func addRectangle(_ item: Rectangle) {
        items.append(item)
        setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        items.forEach { (item) in
            
            if let rect = item as? Rectangle {
                context.setFillColor(rect.color.cgColor)
                context.fill([rect.rect])
                
                if rect.selected {
                    
                    context.setStrokeColor(UIColor.systemRed.cgColor)
                    context.setLineWidth(3.0)
                    context.stroke(rect.rect)
                }

            } else if let line = item as? Line {
                for (index, point) in (line.points.enumerated()) {
                    if index == 0 {
                        context.move(to: point)
                    } else {
                        context.addLine(to: point)
                    }
                    context.setStrokeColor(line.color.cgColor)
                    context.setLineWidth(3.0)
                }
                context.setLineCap(.round)
                context.strokePath()
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if lineInputMode {
            items.append(Line(mine: true, points: [CGPoint]()))
        } else {
            guard let point = touches.first?.location(in: nil) else {
                return
            }
            
            let oldSelected = selectedItem
            selectedItem = nil
            for item in items {
                
                if let item = item as? Rectangle, item.rect.contains(point) {
                    item.selected = true
                    selectedItem = item
                    setNeedsDisplay()
                    break
                }
            }
            if let oldSelected = oldSelected, oldSelected.id != selectedItem?.id , let rect = oldSelected as? Rectangle {
                rect.selected = false
                setNeedsDisplay()
            }
            
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: nil), lineInputMode else {
            return
        }
        
        guard let last = items.popLast(), let lastLine = last as? Line else {return}
        lastLine.points.append(point)
        items.append(lastLine)
        setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        lineInputMode = false
    }
}

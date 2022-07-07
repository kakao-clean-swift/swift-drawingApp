//
//  Drawer.swift
//  swift-drawingapp
//
//  Created by kevin.p on 2022/07/04.
//

import Foundation
import UIKit

// 입력에대한 데이터,

// 입출력 컨트롤러, 입출력을 최대한 분리하려 해보자.
class CanvasView: UIView {
    var drawCase: DrawCase?
    
    func startDrawing(type: ShapeTypes) {
        drawCase = DrawCase(type: type)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if drawCase?.shapeType == .Rectangle {
            
        } else if drawCase?.shapeType == .Line {
            
        } else {
            print("select draw case!")
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if drawCase?.shapeType == .Rectangle {
            
        } else if drawCase?.shapeType == .Line {
            
        } else {
            print("select draw case!")
        }
    }
    
    
}

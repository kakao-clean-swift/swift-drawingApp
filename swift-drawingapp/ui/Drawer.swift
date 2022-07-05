//
//  ViewFactory.swift
//  swift-drawingapp
//
//  Created by kevin.p on 2022/07/04.
//

import Foundation
import UIKit

protocol DrawProtocol {
    func startDrawing()
}

protocol BoxDrawProtocol: DrawProtocol {
    func onDrawingBox()
}

protocol LineDrawProtocol: DrawProtocol {
    func onDrawingLine()
}

class BoxDrawer: BoxDrawProtocol {
    func onDrawingBox() {
        
    }
    
    func startDrawing() {
        
    }    
}

class LineDrawer: LineDrawProtocol {
    func onDrawingLine() {
        
    }
    
    func startDrawing() {
        
    }
}

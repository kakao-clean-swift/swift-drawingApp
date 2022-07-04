//
//  WhiteBoard.swift
//  swift-drawingapp
//
//  Created by kakao on 2022/07/04.
//

import Foundation

protocol Board {
    func addSquare()
}

class WhiteBoard: Board {
    var drawings = [Drawing]()
    
    func addSquare() {
        let square = SquareDrawing()
        drawings.append(square)
    }
}

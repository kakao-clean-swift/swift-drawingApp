//
//  PointVerifier.swift
//  swift-drawingapp
//
//  Created by 윤준수 on 2022/07/10.
//

import Foundation

struct PointVerifier {
    var sizeOfMap: Size
    
    func isAvailablePoint(origin: Point, size: Size) -> Bool {
        return 0 <= origin.x && (0..<sizeOfMap.width) ~= origin.x + size.width && 0 <= origin.y && (0..<sizeOfMap.height) ~= origin.y + size.height
    }
}

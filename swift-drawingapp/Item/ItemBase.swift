//
//  ItemBase.swift
//  swift-drawingapp
//
//  Created by Landon.kim on 2022/07/04.
//

import Foundation
import UIKit

protocol ItemBase {
    var id : UUID { get }
    var mine: Bool { get }
    var color: UIColor { get }
    var origin: CGPoint { get }
    var selected: Bool { get set }
    var points: [CGPoint] { get }
}


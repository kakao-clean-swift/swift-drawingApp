//
//  Figure.swift
//  swift-drawingapp
//
//  Created by joel.inju on 2022/07/04.
//

import Foundation

protocol Figure {
    var id: UUID { get }
    var colorIndex: Int { get }
    var points: [Point] { get set }
}

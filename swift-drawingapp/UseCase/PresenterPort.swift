//
//  PresenterPort.swift
//  swift-drawingapp
//
//  Created by joel.inju on 2022/07/11.
//

import Foundation

protocol PresenterPort {
    func touchRect(_ deselectedId: UUID?, _ selectedId: UUID?)
}

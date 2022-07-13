//
//  SelectFigureUseCase.swift
//  swift-drawingapp
//
//  Created by joel.inju on 2022/07/11.
//

import Foundation

protocol SelectFigureUseCase {
    func setPresenter(with port: PresenterPort?)
    
    func touchRect(_ id: UUID?)
}

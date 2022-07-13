//
//  LoginUseCase.swift
//  swift-drawingapp
//
//  Created by fran on 2022/07/11.
//

import Foundation

/**
 login - id 를 받는다.
 */

protocol LoginUseCase {
    func login()
    func didSuccessLogin(id: String)
    func didFailLogin(error: Error)
}

//
//  SyncServerUseCase.swift
//  swift-drawingapp
//
//  Created by fran on 2022/07/11.
//

import Foundation

/**
 sync items - 서버에서 관리하는 모든 item을 받아온다. (내것 포함)
 */

protocol SyncServerUseCase {
    func request(id: String, items: [ItemDrawable])
    func didSuccessSync(data: [String:[ItemDrawable]])     // id : [ItemDrawable]
    func didFailSync(error: Error)
}

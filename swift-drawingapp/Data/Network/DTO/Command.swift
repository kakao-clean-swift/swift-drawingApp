//
//  Command.swift
//  swift-drawingapp
//
//  Created by kakao on 2022/07/04.
//

import Foundation

struct Command : Decodable {
    let header : String
    let id : String
    let length : Int?
    let data : Data?
}

//
//  Command.swift
//  swift-drawingapp
//
//  Created by kevin.p on 2022/07/04.
//

import Foundation

struct Command : Decodable {
    let header : String
    let id : String
    let length : Int?
    let data : Data?
}

struct CommandResponse : Encodable {
    let header : String
    let id : String
}

//
//  ChatData.swift
//  swift-drawingapp
//
//  Created by bean Milky on 2022/07/04.
//

import Foundation

struct Command: Encodable {
    
    enum Header: String {
        case login = "0x10"
        case chat = "0x20"
    }
    
    let header: Header
    let id: String
    let length: Int?
    let data: Data?
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(header.rawValue, forKey: .header)
        try container.encode(id, forKey: .id)
        try container.encode(length, forKey: .length)
        try container.encode(data, forKey: .data)
    }
    
    enum CodingKeys: String, CodingKey {
        case header, id, length, data
    }
}

extension Command {
    func encoded() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}

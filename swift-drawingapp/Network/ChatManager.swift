//
//  ChatManager.swift
//  swift-drawingapp
//
//  Created by bean Milky on 2022/07/04.
//

import Foundation

protocol ChatManagable {
    func login() async -> Bool
    func send(id: String,
              data: Data) async -> Bool
}

class ChatManager: ChatManagable {
    
    let commandFactory: CommandGeneratable
    let client: ChatSendable & ChatConnectable
    
    init(client: ChatSendable & ChatConnectable, commandFactory: CommandGeneratable) {
        self.client = client
        self.commandFactory = commandFactory
        client.start()
    }
    
    func login() async -> Bool {
        let data = commandFactory
            .command(type: .login)
            .encoded()

        return await client.send(data: data!)
    }
    
    func send(id: String, data: Data) async -> Bool {
        let data = commandFactory
            .command(type: .chat, id: id, data: data)
            .encoded()
        
        return await client.send(data: data!)
    }
}

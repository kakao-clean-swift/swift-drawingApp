//
//  ChatManager.swift
//  swift-drawingapp
//
//  Created by bean Milky on 2022/07/04.
//

import Foundation

protocol ChatManagable {
    func login()
    func send(to: String,
              data: Data)
}

class ChatManager: ChatManagable {
    
    let commandFactory: CommandGeneratable
    let client: ChatSendable & ChatConnectable
    
    init(client: ChatSendable & ChatConnectable, commandFactory: CommandGeneratable) {
        self.client = client
        self.commandFactory = commandFactory
        client.start()
    }
    
    func login() {
        let data = commandFactory
            .command(type: .login)
            .encoded()

        client.send(data: data!)
    }
    
    func send(to: String,
              data: Data) {
        let data = commandFactory
            .command(type: .chat, id: to, data: data)
            .encoded()
        
        client.send(data: data!)
    }
}

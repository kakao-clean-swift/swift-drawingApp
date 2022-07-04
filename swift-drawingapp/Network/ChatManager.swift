//
//  ChatManager.swift
//  swift-drawingapp
//
//  Created by bean Milky on 2022/07/04.
//

import Foundation

class ChatManager {
    
    let client: ChatSendable & ChatConnectable
    
    init(client: ChatSendable & ChatConnectable) {
        self.client = client
    }
    
}

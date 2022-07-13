//
//  ShapeSender.swift
//  swift-drawingapp
//
//  Created by bean Milky on 2022/07/11.
//

import Foundation

enum ShapeSyncError: Error {
    case serverError
    case clientError
}

protocol ShapeSendable {
    func send(shapes: [Shape]) async -> Bool
}

protocol ShapeFetchable {
    func get() async -> Bool
}

class ShapeSyncManager: ShapeSendable, ShapeFetchable {
    
    let chatManager: ChatManagable
    
    init(chatManager: ChatManagable) {
        self.chatManager = chatManager
    }
    
    func send(shapes: [Shape]) async -> Bool {
        await withTaskGroup(of: Bool.self, returning: Bool.self) { taskGroup in
            for shape in shapes {
                taskGroup.addTask { await self.chatManager.send(id: shape.id.uuidString, data: shape.data!) }
            }
            
            return await taskGroup.reduce(true) { return $0 || $1 }
        }
    }
    
    func get() async -> Bool {
        return false
    }
}

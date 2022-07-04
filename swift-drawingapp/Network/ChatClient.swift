//
//  ChatClient.swift
//  swift-drawingapp
//
//  Created by bean Milky on 2022/07/04.
//

import Foundation
import Network

protocol ChatConnectable {
    func start()
    func stop()
}

protocol ChatSendable {
    func send(line: String)
}

class ChatClient: ChatConnectable, ChatSendable {

    private let connection: NWConnection
    private let host: NWEndpoint.Host
    private let port: NWEndpoint.Port
    
    init(hostName: String = "127.0.0.1", port: Int = 9090) {
        self.host = NWEndpoint.Host(hostName)
        self.port = NWEndpoint.Port("\(port)")!
        self.connection = NWConnection(host: host, port: self.port, using: .tcp)
    }

    func start() {
        NSLog("will start")
        self.connection.stateUpdateHandler = self.didChange(state:)
        self.startReceive()
        self.connection.start(queue: .main)
    }

    func stop() {
        self.connection.cancel()
        NSLog("did stop")
    }
    
    func send(line: String) {
        let data = Data("\(line)\r\n".utf8)
        self.connection.send(content: data, completion: NWConnection.SendCompletion.contentProcessed { error in
            if let error = error {
                NSLog("did send, error: %@", "\(error)")
                self.stop()
            } else {
                NSLog("did send, data: %@", data as NSData)
            }
        })
    }

    private func didChange(state: NWConnection.State) {
        switch state {
        case .setup:
            break
        case .waiting(let error):
            NSLog("is waiting: %@", "\(error)")
        case .preparing:
            break
        case .ready:
            break
        case .failed(let error):
            NSLog("did fail, error: %@", "\(error)")
            self.stop()
        case .cancelled:
            NSLog("was cancelled")
            self.stop()
        @unknown default:
            break
        }
    }

    private func startReceive() {
        self.connection.receive(minimumIncompleteLength: 1, maximumLength: 65536) { data, _, isDone, error in
            if let data = data, !data.isEmpty {
                NSLog("did receive, data: %@", data as NSData)
            }
            if let error = error {
                NSLog("did receive, error: %@", "\(error)")
                self.stop()
                return
            }
            if isDone {
                NSLog("did receive, EOF")
                self.stop()
                return
            }
            self.startReceive()
        }
    }
}

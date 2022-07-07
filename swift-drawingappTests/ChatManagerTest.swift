//
//  swift_drawingappTests.swift
//  swift-drawingappTests
//
//

import XCTest
@testable import swift_drawingapp

class ChatClientStub: ChatSendable {
    
    var sentData: Data?
    var didStart: Bool?
    var didStop: Bool?
    
    func send(data: Data) {
        sentData = data
    }
}

extension ChatClientStub: ChatConnectable {
    func start() {
        didStart = true
    }
    
    func stop() {
        didStop = true
    }
}

class ChatManagerTest: XCTestCase {

    func test_클라이언트_로그인() throws {
        let client = ChatClientStub()
        let manager = ChatManager(client: client,
                                  commandFactory: CommandFactory())
        
        XCTAssert(client.didStart == true)
        
        manager.login()
        
        XCTAssertNotNil(client.sentData, "login data should be sent")
    }

    func test_클라이언트_데이터_전송() throws {
        let client = ChatClientStub()
        let manager = ChatManager(client: client,
                                  commandFactory: CommandFactory())
        
        XCTAssert(client.didStart == true)
                
        manager.send(to: "test", data: "test".data(using: .utf8)!)
        
        XCTAssertNotNil(client.sentData, "data should be sent")
    }
}

//
//  swift_drawingappTests.swift
//  swift-drawingappTests
//
//

import XCTest
@testable import swift_drawingapp

class CommandGenerateTest: XCTestCase {

    func test_로그인_커맨드_생성() throws {
        
        let factory = CommandFactory()
        let command = factory.command(type: .login,
                                      id: #function,
                                      data: #function.data(using: .utf8)!)
        
        XCTAssert(command.header == .login)
        XCTAssert(command.id == #function)
        XCTAssert(command.data == #function.data(using: .utf8))
    }

    func test_챗_커맨드_생성() throws {
        
        let factory = CommandFactory()
        let command = factory.command(type: .chat,
                                      id: #function,
                                      data: #function.data(using: .utf8)!)
        
        XCTAssert(command.header == .chat)
        XCTAssert(command.id == #function)
        XCTAssert(command.data == #function.data(using: .utf8))
    }
}

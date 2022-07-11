//
//  DrawingUseCasesTests.swift
//  DrawingUseCasesTests
//
//  Created by jaychoi on 2022/07/11.
//

import XCTest
@testable import DrawingUseCases

class DrawingUseCasesTests: XCTestCase {

    var localStore: LocalStore!
    
    var add: AddShapes!
    
    override func setUpWithError() throws {
        localStore = localStore()
        add = AddShapes(stores: [localStore])
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAddRectangle() async throws {
        let shape = try await add.addRectangle(stroke: .systemBlue, frame: .zero)
        XCTAssertEqual(shape.stroke, .systemBlue)
        XCTAssertEqual(shape.frame, .zero)
    }

    func testAddRectangleToLocalStore() async throws {
        
    }
}

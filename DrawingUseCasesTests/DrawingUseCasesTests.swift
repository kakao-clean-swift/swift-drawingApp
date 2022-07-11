//
//  DrawingUseCasesTests.swift
//  DrawingUseCasesTests
//
//  Created by jaychoi on 2022/07/11.
//

import XCTest
@testable import DrawingUseCases

class DrawingUseCasesTests: XCTestCase {

    var add: AddShapes!
    
    override func setUpWithError() throws {
        add = AddShapes()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAddRectangle() throws {
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

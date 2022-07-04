//
//  swift_drawingappTests.swift
//  swift-drawingappTests
//
//  Created by JK on 2022/07/04.
//

import XCTest
@testable import swift_drawingapp

class swift_drawingappTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDrawingSquare() {
        let drawingManager = DrawingManager()
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 1000, height: 1000))
        drawingManager.drawSquare(in: view)
        drawingManager.drawSquare(in: view)
        XCTAssertEqual(drawingManager.squares.count, 2)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

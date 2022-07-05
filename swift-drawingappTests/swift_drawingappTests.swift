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
        let canvasManager = CanvasManager()
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 1000, height: 1000))
        canvasManager.start(in: view)
        canvasManager.drawSquare()
        canvasManager.drawSquare()
        XCTAssertEqual(canvasManager.squareViews.count, 2)
    }

    func testCreatingRandomRectFromSquare() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 1000, height: 1000))
        let square = Square(in: view.frame)
        let randomRect = square.createRandomRect(in: view.frame)

        XCTAssertTrue(randomRect.minX > 0 && randomRect.maxX < 1000)
        XCTAssertTrue(randomRect.minY > 0 && randomRect.maxY < 1000)
        XCTAssertTrue(randomRect.width == 100)
        XCTAssertTrue(randomRect.height == 100)
    }

    func testCreatingRectFromDrawing() {
        var drawing = Drawing()
        drawing.coordinates = [CGPoint(x: 10, y: 10), CGPoint(x: 20, y: 10), CGPoint(x: 20, y: 20), CGPoint(x: 10, y: 20), CGPoint(x: 10, y: 10)]
        let drawingRect = drawing.rect
        XCTAssertEqual(drawingRect, CGRect(x: 10, y: 10, width: 10, height: 10))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

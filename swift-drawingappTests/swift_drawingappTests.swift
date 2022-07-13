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

    func testDrawingObject_생성() {
        let squareObject1 = DrawingObject(type: .square, color: .systemPurple)
        let squareObject2 = DrawingObject(type: .square, color: .systemPurple)
        XCTAssertNotEqual(squareObject1, squareObject2)
    }

    func testDrawingViewModel_아이템추가() {
        let viewModel = DrawingViewModel()
        viewModel.didTouchSquareButton()
        viewModel.didManualDrawing(color: .systemPurple, points: [CGPoint(x: 100, y: 100), CGPoint(x: 150, y: 200)])
        viewModel.didTouchSquareButton()
        viewModel.didTouchSquareButton()

        print(viewModel.drawableItems)
        XCTAssertEqual(viewModel.drawableItems.count, 4)
    }


    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

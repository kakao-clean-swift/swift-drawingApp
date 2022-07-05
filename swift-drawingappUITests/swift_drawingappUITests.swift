//
//  swift_drawingappUITests.swift
//  swift-drawingappUITests
//
//  Created by JK on 2022/07/04.
//

import XCTest

class swift_drawingappUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSquareAction() throws {
        app.buttons["사각형"].tap()
        app.buttons["사각형"].tap()
        app.buttons["사각형"].tap()
        app.buttons["사각형"].tap()
        app.buttons["사각형"].tap()
        app.buttons["사각형"].tap()
        app.buttons["사각형"].tap()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}

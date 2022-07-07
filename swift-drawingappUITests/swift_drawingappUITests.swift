//
//  swift_drawingappUITests.swift
//  swift-drawingappUITests
//
//  Created by JK on 2022/07/04.
//

import XCTest

class swift_drawingappUITests: XCTestCase {
    var app: XCUIApplication!
    
    func test_사각형추가후_클릭_성공() {
        app.buttons["사각형"].tap()
        let view1Element = app.otherElements["view1"]
        view1Element.tap()
    }
    
    func test_사각형추가후_더블클릭_성공() {
        app.buttons["사각형"].tap()
        let view1Element = app.otherElements["view1"]
        view1Element.tap()
        view1Element.tap()
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        app = nil
    }
}

//
//  swift_drawingappTests.swift
//  swift-drawingappTests
//
//  Created by JK on 2022/07/04.
//

import XCTest
@testable import swift_drawingapp

class DrawersTest: XCTestCase {

    var screen: Screen!
    var drawers: Drawers!
    
    override func setUpWithError() throws {
        screen = Screen(size: .init(width: 1024, height: 1024))
        drawers = Drawers(screen: screen)
    }

    override func tearDownWithError() throws {
    }

    func testCreateRectangles() {
        drawers.addRectangle()
        drawers.addRectangle()
        
        XCTAssertEqual(drawers.countOfShapes, 2)
        
        let shape1 = drawers.shape(of: 0) as! Rectangle
        let shape2 = drawers.shape(of: 1) as! Rectangle
        XCTAssertNotEqual(shape1.id, shape2.id)
    }

}

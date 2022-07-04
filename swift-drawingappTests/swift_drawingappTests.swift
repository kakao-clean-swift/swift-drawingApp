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
    var drawers: Drawers<MockColorize>!
    
    var mockColorize: MockColorize!
    
    override func setUpWithError() throws {
        mockColorize = MockColorize()
        screen = Screen(size: .init(width: 1024, height: 1024))
        drawers = Drawers(screen: screen, randomColorize: mockColorize)
    }

    override func tearDownWithError() throws {
    }

    func testCreateRectangles() {
        mockColorize.color = UIColor.systemBlue
        drawers.addRectangle()
        mockColorize.color = UIColor.systemTeal
        drawers.addRectangle()
        
        XCTAssertEqual(drawers.countOfShapes, 2)
        
        let shape1 = drawers.shape(of: 0) as! Rectangle
        let shape2 = drawers.shape(of: 1) as! Rectangle
        XCTAssertNotEqual(shape1.id, shape2.id)
        XCTAssertEqual(shape1.color, UIColor.systemTeal)
        XCTAssertEqual(shape2.color, UIColor.systemBlue)
    }

    final class MockColorize: Randomizable {
        var color: UIColor = .init()
        func value() -> UIColor {
            return color
        }
    }
}

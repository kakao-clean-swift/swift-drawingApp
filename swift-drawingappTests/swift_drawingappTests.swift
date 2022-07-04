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
    var drawers: Drawers<MockColorize, MockRandomFrame>!
    
    override func setUpWithError() throws {
        screen = Screen(size: .init(width: 1024, height: 1024))
        drawers = Drawers(screen: screen)
    }

    override func tearDownWithError() throws {
    }

    func testCreateRectangles() {
        MockColorize.color = UIColor.systemBlue
        MockRandomFrame.frame = CGRect(origin: .init(x: 0, y: 120), size: .init(width: 100, height: 100))
        drawers.addRectangle()
        MockColorize.color = UIColor.systemTeal
        MockRandomFrame.frame = CGRect(origin: .init(x: 120, y: 120), size: .init(width: 100, height: 100))
        drawers.addRectangle()
        
        XCTAssertEqual(drawers.countOfShapes, 2)
        
        let shape1 = drawers.shape(of: 0) as! Rectangle
        XCTAssertEqual(shape1.frame, CGRect(x: 0, y: 120, width: 100, height: 100))
        XCTAssertEqual(shape1.color, UIColor.systemBlue)
        
        let shape2 = drawers.shape(of: 1) as! Rectangle
        
        XCTAssertEqual(shape2.frame, CGRect(x: 120, y: 120, width: 100, height: 100))
        XCTAssertEqual(shape2.color, UIColor.systemTeal)
        
        XCTAssertNotEqual(shape1.id, shape2.id)
    }
    
    func testRectangleFrameLimitation() {
        MockRandomFrame.frame = CGRect(x: -120, y: -120, width: 100, height: 100)
        drawers.addRectangle()
        
        let shape1 = drawers.shape(of: 0) as! Rectangle
        XCTAssertEqual(shape1.frame, CGRect(x: 0, y: 0, width: 100, height: 100))
        
        MockRandomFrame.frame = CGRect(x: 1024, y: 1024, width: 100, height: 100)
        drawers.addRectangle()
        
        let shape2 = drawers.shape(of: 1) as! Rectangle
        XCTAssertEqual(shape2.frame, CGRect(x: 924, y: 924, width: 100, height: 100))
    }

    final class MockColorize: Randomizable {
        static var color: UIColor = .init()
        static func value() -> UIColor {
            return color
        }
    }
    
    final class MockRandomFrame: BoundaryRandomizable {
        static var frame: CGRect = .init()
        
        static func value(in boundary: FrameBoundary) -> CGRect {
            boundary.calibration(value: frame)
        }
    }
}

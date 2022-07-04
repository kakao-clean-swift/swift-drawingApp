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
        drawers.addRectangle()
        MockColorize.color = UIColor.systemTeal
        drawers.addRectangle()
        
        XCTAssertEqual(drawers.countOfShapes, 2)
        
        let shape1 = drawers.shape(of: 0) as! Rectangle
        XCTAssertEqual(shape1.frame.size, CGSize(width: 100, height: 100))
        XCTAssertEqual(shape1.color, UIColor.systemBlue)
        
        let shape2 = drawers.shape(of: 1) as! Rectangle
        
        XCTAssertEqual(shape2.frame.size, CGSize(width: 100, height: 100))
        XCTAssertEqual(shape2.color, UIColor.systemTeal)
        
        XCTAssertNotEqual(shape1.id, shape2.id)
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

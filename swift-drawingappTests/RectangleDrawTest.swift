//
//  RectangleDrawTest.swift
//  swift-drawingappTests
//
//  Created by Hochang Lee on 2022/07/08.
//

import XCTest
@testable import swift_drawingapp

class RectangleDrawTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testRectangleDrawChecksCanDrawWell() throws {
        let width: Float = 100
        let height: Float = 100
        let paperWidth: Float = 200
        let paperHeigt: Float = 200
        
        let drawable: FigureDrawable = RectangleDraw(width: width, height: height, paperWidth: paperWidth, paperHeight: paperHeigt)
        
        for i in 0...100 {
            for j in 0...100 {
                XCTAssertTrue(drawable.canDraw(at: Point(x: Float(i), y: Float(j))))
            }
        }
        
        for i in 101...200 {
            for j in 101...200 {
                XCTAssertFalse(drawable.canDraw(at: Point(x: Float(i), y: Float(j))))
            }
        }
    }
    
    func testRectangleDrawChecksCanDrawWell2() throws {
        let width: Float = 100
        let height: Float = 100
        let paperWidth: Float = 99
        let paperHeigt: Float = 99
        
        let drawable: FigureDrawable = RectangleDraw(width: width, height: height, paperWidth: paperWidth, paperHeight: paperHeigt)
        
        for i in 0...99 {
            for j in 0...99 {
                XCTAssertFalse(drawable.canDraw(at: Point(x: Float(i), y: Float(j))))
            }
        }
    }
    
    func testRectangleDrawReturnsRectangleWell() throws {
        let width: Float = 100
        let height: Float = 100
        let paperWidth: Float = 200
        let paperHeigt: Float = 200
        
        let drawable: FigureDrawable = RectangleDraw(width: width, height: height, paperWidth: paperWidth, paperHeight: paperHeigt)

        for i in 0...100 {
            for j in 0...100 {
                let point = Point(x: Float(i), y: Float(j))
                let rectangle = drawable.draw(at: point) as! Rectangle
                XCTAssertEqual(rectangle.point, point)
                XCTAssertEqual(rectangle.width, width)
                XCTAssertEqual(rectangle.height, height)
            }
        }
    }
}

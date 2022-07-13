//
//  PathDrawTest.swift
//  swift-drawingappTests
//
//  Created by Hochang Lee on 2022/07/08.
//

import XCTest
@testable import swift_drawingapp

class PathDrawTest: XCTestCase {

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

    func testPathDrawCheckesCanDrawWell() throws {
        let paperWidth: Float = 100
        let paperHeigt: Float = 100
        let drawable: PathDrawable = PathDraw(paperWidth: paperWidth, paperHeight: paperHeigt)
        
        for i in 0...100 {
            for j in 0...100 {
                let point = Point(x: Float(i), y: Float(j))
                XCTAssertTrue(drawable.canDraw(at: point))
            }
        }
    }
    
    func testPathDrawCheckesCanDrawWell2() throws {
        let paperWidth: Float = 100
        let paperHeigt: Float = 100
        let drawable: PathDrawable = PathDraw(paperWidth: paperWidth, paperHeight: paperHeigt)
        
        for i in 101...200 {
            for j in 101...200 {
                let point = Point(x: Float(i), y: Float(j))
                XCTAssertFalse(drawable.canDraw(at: point))
            }
        }
    }
    
    func testPathDrawDrawsWell() throws {
        let paperWidth: Float = 100
        let paperHeigt: Float = 100
        let drawable: PathDrawable = PathDraw(paperWidth: paperWidth, paperHeight: paperHeigt)
        
        var points = [Point]()
        for i in 0...100 {
            for j in 0...100 {
                points.append(Point(x: Float(i), y: Float(j)))
            }
        }

        drawable.startDraw(at: points[0])
        for i in 1..<points.count - 1 {
            drawable.continueDraw(at: points[i])
        }
        
        let savedPoints = drawable.endDraw(at: points[points.count - 1])
        
        XCTAssertEqual(points.count, savedPoints.count)
        for i in 0..<points.count {
            XCTAssertEqual(points[i], savedPoints[i])
        }
    }
}

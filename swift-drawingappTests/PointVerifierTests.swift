//
//  swift_drawingappTests.swift
//  swift-drawingappTests
//
//  Created by JK on 2022/07/04.
//

import XCTest
@testable import swift_drawingapp

class PointVerifierTests: XCTestCase {

    func testSmallMap() throws {
        let sizeOfMap = Size(width: 10, height: 10)
        let verifier = PointVerifier(sizeOfMap: sizeOfMap)
        
        let sizeOfRectangle = Size(width: 20, height: 20)
        
        XCTAssertFalse(verifier.isAvailablePoint(origin: Point(y: 0, x: 0), size: sizeOfRectangle))
    }
    
    func testFit() throws {
        let sizeOfMap = Size(width: 100, height: 100)
        let verifier = PointVerifier(sizeOfMap: sizeOfMap)
        
        let sizeOfRectangle = Size(width: 100, height: 100)
        
        XCTAssertTrue(verifier.isAvailablePoint(origin: Point(y: 0, x: 0), size: sizeOfRectangle))
    }
    
    func testFitBigMap() throws {
        let sizeOfMap = Size(width: 400, height: 750)
        let verifier = PointVerifier(sizeOfMap: sizeOfMap)
        
        let sizeOfRectangle = Size(width: 100, height: 100)
        
        XCTAssertTrue(verifier.isAvailablePoint(origin: Point(y: 200, x: 200), size: sizeOfRectangle))
    }
    
    func testOutOfBoundary() throws {
        let sizeOfMap = Size(width: 100, height: 100)
        let verifier = PointVerifier(sizeOfMap: sizeOfMap)
        
        let sizeOfRectangle = Size(width: 100, height: 100)
        
        XCTAssertFalse(verifier.isAvailablePoint(origin: Point(y: 0, x: 1), size: sizeOfRectangle))
        XCTAssertFalse(verifier.isAvailablePoint(origin: Point(y: 1, x: 0), size: sizeOfRectangle))
        XCTAssertFalse(verifier.isAvailablePoint(origin: Point(y: 1, x: 1), size: sizeOfRectangle))
    }
    
    func testOriginOutOfBounds() throws {
        let sizeOfMap = Size(width: 100, height: 100)
        let verifier = PointVerifier(sizeOfMap: sizeOfMap)
        
        let sizeOfRectangle = Size(width: 100, height: 100)
        
        XCTAssertFalse(verifier.isAvailablePoint(origin: Point(y: -50, x: 0), size: sizeOfRectangle))
        XCTAssertFalse(verifier.isAvailablePoint(origin: Point(y: 0, x: -50), size: sizeOfRectangle))
        XCTAssertFalse(verifier.isAvailablePoint(origin: Point(y: -50, x: -50), size: sizeOfRectangle))
    }
}

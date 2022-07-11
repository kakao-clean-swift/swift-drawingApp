//
//  ColorVerifierTests.swift
//  swift-drawingappTests
//
//  Created by 윤준수 on 2022/07/11.
//

import XCTest
@testable import swift_drawingapp

class ColorVerifierTests: XCTestCase {

    private var verifier: ColorVerifier!
    
    override func setUpWithError() throws {
        verifier = ColorVerifier()
    }

    func testSystemRed() throws {
        let systemRedColor = Color(red: 1, green: 0, blue: 0)
        
        XCTAssertFalse(verifier.isAvailableColor(color: systemRedColor))
    }

    func testCustomUnavailableColor() throws {
        let systemRedColor = Color(red: 1, green: 0, blue: 0)
        let customColor = Color(red: 0.5, green: 0.2, blue: 0.1)
      
        verifier.setUnavailableColor(customColor)
        
        XCTAssertFalse(verifier.isAvailableColor(color: customColor))
        XCTAssertFalse(verifier.isAvailableColor(color: systemRedColor))
    }
    
    func testCustomColor() throws {
        let systemRedColor = Color(red: 1, green: 0, blue: 0)
        let customColor = Color(red: 0.5, green: 0.2, blue: 0.1)
      
        XCTAssertTrue(verifier.isAvailableColor(color: customColor))
        XCTAssertFalse(verifier.isAvailableColor(color: systemRedColor))
    }
}

//
//  swift_drawingappTests.swift
//  swift-drawingappTests
//
//  Created by JK on 2022/07/04.
//

import XCTest
@testable import swift_drawingapp

class swift_drawingappTests: XCTestCase {
    func test_무작위_랜덤_위치() throws {
        let drawingScreen = DrawingScreen(frame: CGRect(origin: .zero, size: CGSize(width: 1000, height: 1000)))

        drawingScreen.padding = UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50)

        for _ in (0..<200) {
            XCTAssertTrue(CGRect(x: 50, y: 50, width: 900, height: 900).contains(drawingScreen.randomPosition))
        }
    }

    func test_스크린_추가된_뷰_모델_추출하기() throws {
        let drawingScreen = DrawingScreen(frame: CGRect(origin: .zero, size: CGSize(width: 1000, height: 1000)))
        let line = Line(points: [.zero, CGPoint(x: 100, y: 100)])
        let square = Square(center: CGPoint(x: 200, y: 200), size: CGSize(width: 100, height: 100))

        drawingScreen.addView(shape: line)
        drawingScreen.addView(shape: square)

        XCTAssertTrue(drawingScreen.shapes.count == 2)
        XCTAssertTrue(drawingScreen.shapes.filter({ $0 == line || $0 == square }).count == 2)
    }
}

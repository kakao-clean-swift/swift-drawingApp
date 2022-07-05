//
//  swift_drawingappTests.swift
//  swift-drawingappTests
//
//  Created by JK on 2022/07/04.
//

import XCTest
@testable import swift_drawingapp

class swift_drawingappTests: XCTestCase {

    func test_뷰_사각형추가_성공() {
        // given
        let rect = Rect(Point(x: 500, y: 500))
        
        // when
        let rectView = RectView(rect)
        
        // then
        XCTAssertNotNil(rectView.figureId())
    }
    
    func test_뷰모델_사각형추가_성공() {
        // given
        let viewModel = DrawingViewModel()
        
        // when
        viewModel.createRect()
        
        // then
        XCTAssertEqual(viewModel.figures.count, 1)
    }
    
    func test_뷰_드로잉추가_성공() {
        // given
        
        
        // when
        
        
        // then
    }
    
    func test_뷰모델_드로잉추가_성공() {
        // given
        
        
        // when
        
        
        // then
    }
    
    func test_로그인_성공() {
        
    }
    
    
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
}

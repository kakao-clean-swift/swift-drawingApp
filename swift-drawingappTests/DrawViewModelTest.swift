//
//  DrawViewModelTest.swift
//  swift-drawingappTests
//
//  Created by bean Milky on 2022/07/07.
//

import XCTest
import Combine
@testable import swift_drawingapp

class DrawViewModelTest: XCTestCase {
    
    var disposables = Set<AnyCancellable>()
    
    func test_shape_입력_테스트() throws {
        let viewModel = DrawViewModel()
        let shape = Rectangle(points: [])
        viewModel.$shapes
            .dropFirst()
            .sink(receiveCompletion: { result in
                XCTAssert(result == .finished)
            }, receiveValue: { shapes in
                XCTAssertTrue(shapes.contains(where: { s in (s as? Rectangle) == shape }))
            })
            .store(in: &disposables)
        viewModel.shapes.append(shape)
        
        XCTAssert(viewModel.shapes.contains(where: { s in (s as? Rectangle) == shape }))
    }
    
}

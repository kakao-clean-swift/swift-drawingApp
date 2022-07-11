import XCTest
@testable import Entity

class LineDrawingTests: XCTestCase {

    func test_line_drawing_append() {
        // given
        var sut = LineDrawing(initialPoint: .zero)
        XCTAssertEqual(sut.points.count, 1)
        
        // when
        sut.addPoint(CGPoint(x: 10, y: 10))
        
        // then
        XCTAssertEqual(sut.points.count, 2)
    }
}

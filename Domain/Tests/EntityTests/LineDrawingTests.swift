import XCTest
@testable import Entity

class LineDrawingTests: XCTestCase {

    func test_line_drawing_append() {
        // given
        var sut = LineDrawing()
        XCTAssertTrue(sut.points.isEmpty)
        
        // when
        sut.addPoint(CGPoint(x: 10, y: 10))
        
        // then
        XCTAssertFalse(sut.points.isEmpty)
    }
}

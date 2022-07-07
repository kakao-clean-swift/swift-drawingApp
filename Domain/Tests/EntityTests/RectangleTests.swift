import XCTest
@testable import Entity

class RectangleTests: XCTestCase {
    
    func testEncoding() throws {
        // given
        let rectangle = Rectangle(screenRect: CGRect(x: 100, y: 100, width: 100, height: 100), size: 100)

        // when
        let encodedData = try JSONEncoder().encode(rectangle)
        let decodedModel = try JSONDecoder().decode(Rectangle.self, from: encodedData)
        
        // then
        XCTAssertEqual(rectangle.id, decodedModel.id)
        XCTAssertEqual(rectangle.color.hex, decodedModel.color.hex)
        XCTAssertEqual(rectangle.points, decodedModel.points)
    }
}

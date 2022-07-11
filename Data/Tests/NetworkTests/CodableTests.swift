import XCTest
import Entity
@testable import Network

class CodableTests: XCTestCase {
    
    func testRectangleDTO() throws {
        // given
        let originalRectangle = RectangleDTO(id: UUID(), colorHex: "#333333", points: [.zero])
        
        // when
        let encodedData = try JSONEncoder().encode(originalRectangle)
        let decodedRectangle = try JSONDecoder().decode(RectangleDTO.self, from: encodedData)
        
        // then
        XCTAssertEqual(originalRectangle.id, decodedRectangle.id)
        XCTAssertEqual(originalRectangle.colorHex, decodedRectangle.colorHex)
        XCTAssertEqual(originalRectangle.points, decodedRectangle.points)
    }
}

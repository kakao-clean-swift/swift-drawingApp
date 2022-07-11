import XCTest
import Entity
@testable import Network

class DataMappingTests: XCTestCase {
    
    func test_rectangle_data_mapping() {
        // given
        let rectangle = Rectangle(screenRect: CGRect(x: 100, y: 100, width: 100, height: 100), size: 100)

        // when
        let dto = rectangle.toDTO()
        let rectangleFromDTO = dto.toEntity()
        
        // then
        XCTAssertEqual(rectangle.id, rectangleFromDTO.id)
        XCTAssertEqual(rectangle.points, rectangleFromDTO.points)
        XCTAssertEqual(rectangle.color.hex, rectangleFromDTO.color.hex)
    }
}

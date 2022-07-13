import XCTest
@testable import Util

class RandomPointsGeneratorTests: XCTestCase {
    
    func test_generator_should_give_valid_points() {
        // given
        let screenRect = CGRect(x: 30, y: 30, width: 300, height: 600)
        let rectangleSize: CGFloat = 100
        
        // when
        let points = RandomPointsGenerator.rectangePoints(screenRect: screenRect, size: rectangleSize)
        
        // then
        let pointsInBoundary = points.filter {
            return screenRect.minX...screenRect.maxX ~= $0.x && screenRect.minY...screenRect.maxY ~= $0.y
        }
        XCTAssertEqual(pointsInBoundary.count, points.count)
    }

    func test_generator_should_give_boundary_points() {
        // given
        let screenRect = CGRect(x: 0, y: 0, width: 100, height: 100)
        let rectangleSize: CGFloat = 100
        
        // when
        let points = RandomPointsGenerator.rectangePoints(screenRect: screenRect, size: rectangleSize)
        
        // then
        let expected = [
            CGPoint(x: 0, y: 0),
            CGPoint(x: 100, y: 0),
            CGPoint(x: 0, y: 100),
            CGPoint(x: 100, y: 100),
        ]
        XCTAssertEqual(points, expected)
    }
    
    func test_generator_should_give_empty_points_with_invalid_input() {
        // given
        let screenRect = CGRect(x: 0, y: 0, width: 10, height: 10)
        let rectangleSize: CGFloat = 100
        
        // when
        let points = RandomPointsGenerator.rectangePoints(screenRect: screenRect, size: rectangleSize)
        
        // then
        XCTAssertEqual(points, [])
    }
}

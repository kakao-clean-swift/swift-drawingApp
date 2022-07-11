import XCTest
import Entity
@testable import Repository

final class LocalRepositoryTests: XCTestCase {
    
    var sut: LocalRepositoryImpl!
    
    override func setUpWithError() throws {
        sut = LocalRepositoryImpl()
    }
    
    func test_repository_save_new_shapes() {
        // given
        let shapes: [Shape] = [Rectangle(screenRect: .zero),
                               LineDrawing(initialPoint: .zero)]
        
        // when
        shapes.forEach { shape in
            sut.saveShape(shape)
        }
        
        // then
        XCTAssertEqual(sut.shapes.map { $0.id }, shapes.map { $0.id })
    }
    
    func test_repository_save_already_existed_shape() {
        // given
        var lineDrawing = LineDrawing(initialPoint: .zero)
        sut.saveShape(lineDrawing)
        
        // when
        lineDrawing.addPoint(CGPoint(x: 2, y: 2))
        lineDrawing.addPoint(CGPoint(x: 3, y: 3))
        sut.saveShape(lineDrawing)
        
        // then
        XCTAssertEqual(lineDrawing.points, [
            .zero,
            CGPoint(x: 2, y: 2),
            CGPoint(x: 3, y: 3)
        ])
    }
}

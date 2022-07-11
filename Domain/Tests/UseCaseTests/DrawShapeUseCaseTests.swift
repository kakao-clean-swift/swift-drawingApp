import XCTest
@testable import Entity
@testable import UseCase

class LocalRepositoryMock: LocalRepository {
    var saveShapeCallCount = 0
    var addPointCallCount = 0
    
    func saveShape(_ shape: Shape) {
        saveShapeCallCount += 1
    }
    
    func addPoint(_ point: CGPoint, to shape: Shape) {
        addPointCallCount += 1
    }
}

class DrawShapeUseCaseTests: XCTestCase {

    var useCase: DrawShapeUseCaseImpl!
    var repositoryMock: LocalRepositoryMock {
        return useCase.repository as! LocalRepositoryMock
    }
    
    override func setUpWithError() throws {
        useCase = DrawShapeUseCaseImpl(repository: LocalRepositoryMock())
    }
    
    func test_useCase_call_save_when_add_rectangle() {
        // given
        XCTAssertEqual(repositoryMock.saveShapeCallCount, 0)
        
        // when
        _ = useCase.addRandomRectangle(in: .zero)
        
        // then
        XCTAssertEqual(repositoryMock.saveShapeCallCount, 1)
    }
    
    func test_useCase_call_save_when_add_line_drawing() {
        // given
        XCTAssertEqual(repositoryMock.saveShapeCallCount, 0)
        
        // when
        _ = useCase.addLineDrawing(with: .zero)
        
        // then
        XCTAssertEqual(repositoryMock.saveShapeCallCount, 1)
    }
    
    func test_useCase_call_save_when_add_point() {
        // given
        XCTAssertEqual(repositoryMock.addPointCallCount, 0)
        
        // when
        _ = useCase.addPoint(.zero, to: LineDrawing(initialPoint: .zero))
        
        // then
        XCTAssertEqual(repositoryMock.addPointCallCount, 1)
    }
}

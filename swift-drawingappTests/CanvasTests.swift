import XCTest
@testable import swift_drawingapp

class CanvasTests: XCTestCase {

    var sut: Canvas?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        self.sut = Canvas(items: [], selected: nil)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        self.sut = nil
    }
    
    func test_add_rectangle() {
        // given
        let rectangle = Rectangle(width: 100, height: 100, center: RelativePoint(xRatio: 0.5, yRatio: 0.5)!)
        
        // when
        let item =  self.sut?.addDrawingItem(item: rectangle)
        
        // then
        XCTAssertTrue(item!.isEqual(to: rectangle))
    }
    
    func test_add_rectangle_fail_when_already_exists() {
        // given
        let rectangle = Rectangle(width: 100, height: 100, center: RelativePoint(xRatio: 0.5, yRatio: 0.5)!)
        self.sut = Canvas(items: [rectangle], selected: nil)
        
        // when
        self.sut?.addDrawingItem(item: rectangle)
        
        // then
        XCTAssertTrue(self.sut?.items.count == 1)
    }
    
    func test_add_line() {
        // given
        let line = Line(id: UUID(), paths: [RelativePoint(xRatio: 0.1, yRatio: 0.1)!])
        
        // when
        let item = self.sut?.addDrawingItem(item: line)
        
        // then
        XCTAssertTrue(item!.isEqual(to: line))
    }
    
    func test_add_line_fail_when_already_exists() {
        // given
        let line = Line(id: UUID(), paths: [RelativePoint(xRatio: 0.1, yRatio: 0.1)!])
        self.sut = Canvas(items: [line], selected: nil)
        
        // when
        self.sut?.addDrawingItem(item: line)
        
        // then
        XCTAssertTrue(self.sut?.items.count == 1)
    }
    
    func test_select() {
        // given
        let rectangle = Rectangle(width: 100, height: 100, center: RelativePoint(xRatio: 0.5, yRatio: 0.5)!)
        self.sut = Canvas(items: [rectangle], selected: nil)
        
        // when
        let selected = self.sut?.select(id: rectangle.identifier, isSelected: true)
        
        // then
        XCTAssertTrue(self.sut!.selected!.isEqual(to: rectangle))
        XCTAssertTrue(selected!.isEqual(to: rectangle))
    }
    
    func test_deselect() {
        // given
        let rectangle = Rectangle(width: 100, height: 100, center: RelativePoint(xRatio: 0.5, yRatio: 0.5)!)
        self.sut = Canvas(items: [rectangle], selected: rectangle)
        
        // when
        let selected = self.sut?.select(id: rectangle.identifier, isSelected: false)
        
        // then
        XCTAssertNil(selected)
        XCTAssertNil(self.sut!.selected)
    }
    
    func test_move_succeed_when_item_is_movable_and_selected() {
        // given
        let rectangle = Rectangle(width: 100, height: 100, center: RelativePoint(xRatio: 0.5, yRatio: 0.5)!)
        self.sut = Canvas(items: [rectangle], selected: rectangle)
        let targetPoint = RelativePoint(xRatio: 0.2, yRatio: 0.2)!
        
        // when
        self.sut?.addDrawingItem(item: rectangle)
        let moved = self.sut?.moveItem(id: rectangle.identifier, to: targetPoint)
        
        // then
        XCTAssertEqual(targetPoint, moved?.center)
    }
    
    func test_move_fail_when_item_is_not_selected() {
        // given
        let rectangle = Rectangle(width: 100, height: 100, center: RelativePoint(xRatio: 0.5, yRatio: 0.5)!)
        self.sut = Canvas(items: [rectangle], selected: nil)
        let targetPoint = RelativePoint(xRatio: 0.2, yRatio: 0.2)!
        
        // when
        let moved = self.sut?.moveItem(id: rectangle.identifier, to: targetPoint)
        
        // then
        XCTAssertNotEqual(targetPoint, moved?.center)
    }
    
    func test_move_fail_when_item_is_not_movable() {
        // given
        let line = Line(paths: [RelativePoint(xRatio: 0.1, yRatio: 0.1)!])
        self.sut = Canvas(items: [line], selected: nil)
        let targetPoint = RelativePoint(xRatio: 0.2, yRatio: 0.2)!
        
        // when
        let moved = self.sut?.moveItem(id: line.identifier, to: targetPoint)
        
        // then
        XCTAssertNotEqual(targetPoint, moved?.center)
    }
}

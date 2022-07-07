import XCTest
@testable import Util

class RandomColorGeneratorTests: XCTestCase {
    
    func test_random_color_generator_except_color() {
        let except = UIColor.systemPink
        let random = RandomColorGenerator.color(except: except)
        XCTAssertNotEqual(except, random)
    }
}

import XCTest
@testable import ConvenientCharacterSets

final class ConvenientCharacterSetsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(ConvenientCharacterSets().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}

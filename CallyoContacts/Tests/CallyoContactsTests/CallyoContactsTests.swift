import XCTest
@testable import CallyoContacts

final class CallyoContactsTests: XCTestCase {
    func testExample() throws {
        let contacts = CallyoContacts()
        XCTAssertEqual(contacts.text, "Hello, World!")
        XCTAssertNotNil(contacts.storyboard)
    }
}

import XCTest
@testable import PJSIP

final class SIPTests: XCTestCase {
    func testInit() throws {
        XCTAssertNoThrow(try initPjSIP())
    }
}

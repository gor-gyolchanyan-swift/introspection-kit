//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE` file in the root directory of the repository this file is in.
//

import XCTest

@testable import IntrospectionKit

internal final class MainTestCase: XCTestCase {

    // MARK: - MainTestCase

    // This scope is intentionally left blank.
}

extension MainTestCase {

    // MARK: - MainTestCase - Testing

    internal func testMain() throws {
        let type = TypeSchematic(Example.self)
        XCTAssertEqual(type.name(.concise), "Example")
        XCTAssertEqual(type.name(.extensive), "IntrospectionKit_Test.Example")
        XCTAssertEqual(type.kind, .nominal(.struct))
        let propertySelection = type.propertySelection
        XCTAssertEqual(propertySelection.count, 4)
        let firstProperty = propertySelection[0]
        XCTAssertEqual(firstProperty.name, "first")
        XCTAssert(firstProperty.type == NSString?.self)
        XCTAssertEqual(firstProperty.offset, 0)
        XCTAssertEqual(firstProperty.isStrong, true)
        XCTAssertEqual(firstProperty.isMutable, true)
        let secondProperty = propertySelection[1]
        XCTAssertEqual(secondProperty.name, "second")
        XCTAssert(secondProperty.type == NSMutableString?.self)
        XCTAssertEqual(secondProperty.offset, 8)
        XCTAssertEqual(secondProperty.isStrong, false)
        XCTAssertEqual(secondProperty.isMutable, true)
        let thirdProperty = propertySelection[2]
        XCTAssertEqual(thirdProperty.name, "third")
        XCTAssert(thirdProperty.type == NSAttributedString?.self)
        XCTAssertEqual(thirdProperty.offset, 16)
        XCTAssertEqual(thirdProperty.isStrong, false)
        XCTAssertEqual(thirdProperty.isMutable, false)
        let fourthProperty = propertySelection[3]
        XCTAssertEqual(fourthProperty.name, "fourth")
        XCTAssert(fourthProperty.type == NSMutableAttributedString?.self)
        XCTAssertEqual(fourthProperty.offset, 24)
        XCTAssertEqual(fourthProperty.isStrong, false)
        XCTAssertEqual(fourthProperty.isMutable, false)
    }
}

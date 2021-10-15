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
        let type = TypeIntrospection(rawValue: Example.self)
        XCTAssertEqual(type.name(.concise), "Example")
        XCTAssertEqual(type.name(.extensive), "IntrospectionKit_Test.Example")
        XCTAssertEqual(type.kind, .structure)
        let properties = type.properties
        XCTAssertEqual(properties.count, 4)
        let firstProperty = properties[0]
        XCTAssertEqual(firstProperty.name, "first")
        XCTAssertEqual(firstProperty.type, TypeIntrospection(rawValue: NSString?.self))
        XCTAssertEqual(firstProperty.offset, 0)
        XCTAssertEqual(firstProperty.isStrong, true)
        XCTAssertEqual(firstProperty.isMutable, true)
        let secondProperty = properties[1]
        XCTAssertEqual(secondProperty.name, "second")
        XCTAssertEqual(secondProperty.type, TypeIntrospection(rawValue: NSMutableString?.self))
        XCTAssertEqual(secondProperty.offset, 8)
        XCTAssertEqual(secondProperty.isStrong, false)
        XCTAssertEqual(secondProperty.isMutable, true)
        let thirdProperty = properties[2]
        XCTAssertEqual(thirdProperty.name, "third")
        XCTAssertEqual(thirdProperty.type, TypeIntrospection(rawValue: NSAttributedString.self))
        XCTAssertEqual(thirdProperty.offset, 16)
        XCTAssertEqual(thirdProperty.isStrong, false)
        XCTAssertEqual(thirdProperty.isMutable, false)
        let fourthProperty = properties[3]
        XCTAssertEqual(fourthProperty.name, "fourth")
        XCTAssertEqual(fourthProperty.type, TypeIntrospection(rawValue: NSMutableAttributedString.self))
        XCTAssertEqual(fourthProperty.offset, 24)
        XCTAssertEqual(fourthProperty.isStrong, false)
        XCTAssertEqual(fourthProperty.isMutable, false)
    }
}

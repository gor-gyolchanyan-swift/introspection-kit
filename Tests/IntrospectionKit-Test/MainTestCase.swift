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

    internal func testIntrospection() throws {
        struct Instance {
            var first: NSString?
            weak var second: NSMutableString?
            unowned(safe) let third: NSAttributedString
            unowned(unsafe) let fourth: NSMutableAttributedString
        }
        let type = TypeIntrospection(rawValue: Instance.self)
        XCTAssertEqual(type.name(.concise), "Instance")
        XCTAssertEqual(type.kind, .structure)
        let properties = type.properties
        XCTAssertEqual(properties.count, 4)
        let firstProperty = properties[0]
        XCTAssertEqual(firstProperty.name, "first")
        XCTAssertEqual(firstProperty.valueType, TypeIntrospection(rawValue: NSString?.self))
        XCTAssertEqual(firstProperty.offset, 0)
        XCTAssertEqual(firstProperty.isStrong, true)
        XCTAssertEqual(firstProperty.isMutable, true)
        let secondProperty = properties[1]
        XCTAssertEqual(secondProperty.name, "second")
        XCTAssertEqual(secondProperty.valueType, TypeIntrospection(rawValue: NSMutableString?.self))
        XCTAssertEqual(secondProperty.offset, 8)
        XCTAssertEqual(secondProperty.isStrong, false)
        XCTAssertEqual(secondProperty.isMutable, true)
        let thirdProperty = properties[2]
        XCTAssertEqual(thirdProperty.name, "third")
        XCTAssertEqual(thirdProperty.valueType, TypeIntrospection(rawValue: NSAttributedString.self))
        XCTAssertEqual(thirdProperty.offset, 16)
        XCTAssertEqual(thirdProperty.isStrong, false)
        XCTAssertEqual(thirdProperty.isMutable, false)
        let fourthProperty = properties[3]
        XCTAssertEqual(fourthProperty.name, "fourth")
        XCTAssertEqual(fourthProperty.valueType, TypeIntrospection(rawValue: NSMutableAttributedString.self))
        XCTAssertEqual(fourthProperty.offset, 24)
        XCTAssertEqual(fourthProperty.isStrong, false)
        XCTAssertEqual(fourthProperty.isMutable, false)
    }

    internal func testPropertyAccess() throws {
        struct Point {
            var x: Float64
            var y: Float64
        }
        var point = Point(x: 12.34, y: 56.78)
        let type = TypeIntrospection(rawValue: Point.self)
        let firstProperty = type.properties[0]
        let secondProperty = type.properties[1]
        XCTAssertEqual(try XCTUnwrap(try firstProperty.getValue(in: point) as? Float64), 12.34)
        XCTAssertEqual(try XCTUnwrap(try secondProperty.getValue(in: point) as? Float64), 56.78)
        try firstProperty.setValue(to: Float64(42), in: &point)
        try secondProperty.setValue(to: Float64(999), in: &point)
        XCTAssertEqual(point.x, 42)
        XCTAssertEqual(point.y, 999)
    }
}

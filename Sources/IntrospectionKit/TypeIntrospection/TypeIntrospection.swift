//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE` file in the root directory of the repository this file is in.
//

public struct TypeIntrospection: RawRepresentable {

    // MARK: RawRepresentable

    public typealias RawValue = Any.Type

    public init(rawValue: RawValue) {
        self.rawValue = rawValue
    }

    public let rawValue: RawValue
}

//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE` file in the root directory of the repository this file is in.
//

extension TypeIntrospection: Equatable {

    // MARK: Equatable

    public static func == (_ some: Self, _ other: Self) -> Bool {
        ObjectIdentifier(some.rawValue) == ObjectIdentifier(other.rawValue)
    }
}

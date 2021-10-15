//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE` file in the root directory of the repository this file is in.
//

extension TypeIntrospection.Properties: Equatable {

    // MARK: Equatable
    
    public static func == (_ some: Self, _ other: Self) -> Bool {
        return some.lazy.map(\.id) == other.lazy.map(\.id)
    }
}


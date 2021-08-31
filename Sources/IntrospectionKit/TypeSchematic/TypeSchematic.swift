//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE` file in the root directory of the repository this file is in.
//

public struct TypeSchematic {

    // MARK: - TypeSchematic

    public init(_ type: Any.Type) {
        self.type = type
    }

    public let type: Any.Type
}

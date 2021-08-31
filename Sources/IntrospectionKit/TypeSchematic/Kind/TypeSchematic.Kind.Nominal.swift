//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE` file in the root directory of the repository this file is in.
//

extension TypeSchematic.Kind {

    // MARK: - TypeSchematic.Kind - Nominal

    /// A nominal type kind.
    public enum Nominal: Hashable {

        // MARK: - TypeSchematic.Kind.Nominal

        /// A `class` type.
        case `class`(Class)

        /// A `struct` type.
        case `struct`

        /// An `enum` type.
        case `enum`

        /// An optional type.
        case optional
    }
}

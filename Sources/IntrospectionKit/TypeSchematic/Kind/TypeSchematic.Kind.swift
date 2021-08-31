//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE` file in the root directory of the repository this file is in.
//

extension TypeSchematic {

    // MARK: - TypeSchematic - Kind

    /// A type kind.
    public enum Kind: Hashable {

        // MARK: - TypeSchematic.Kind

        /// A nominal type.
        case nominal(Nominal)

        /// A structural type.
        case structural(Structural)

        /// A recurrent type.
        case recurrent(Recurrent)

        /// An opaque type.
        case opaque
    }
}

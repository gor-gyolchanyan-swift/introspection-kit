//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE` file in the root directory of the repository this file is in.
//

extension TypeSchematic.Kind {

    // MARK: - TypeSchematic.Kind - Structural

    /// A structural type kind.
    public enum Structural: Hashable {

        // MARK: - TypeSchematic.Kind.Structural

        /// A tuple type.
        case tuple

        /// A monomorphic function type.
        case function

        /// An existential type.
        case existential
    }
}

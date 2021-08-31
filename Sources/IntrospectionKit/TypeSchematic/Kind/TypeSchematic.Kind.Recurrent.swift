//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE` file in the root directory of the repository this file is in.
//

extension TypeSchematic.Kind {

    // MARK: - TypeSchematic.Kind - Recurrent

    /// A recurrent type kind.
    public enum Recurrent: Hashable {

        // MARK: - TypeSchematic.Kind.Recurrent

        /// A proper recurrent type.
        case proper

        /// An existential recurrent type.
        case existential
    }
}

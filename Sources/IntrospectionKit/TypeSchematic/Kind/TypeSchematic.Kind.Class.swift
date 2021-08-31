//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE` file in the root directory of the repository this file is in.
//

extension TypeSchematic.Kind {

    // MARK: - TypeSchematic.Kind - Class

    /// A `class` type kind.
    public enum Class: Hashable {

        // MARK: - TypeSchematic.Kind.Class

        /// A native class type.
        case native

        /// A foreign class type, such as a Core Foundation class.
        case foreign

        /// An class wrapper type, such as an Objective-C class wrapper.
        case wrapper
    }
}

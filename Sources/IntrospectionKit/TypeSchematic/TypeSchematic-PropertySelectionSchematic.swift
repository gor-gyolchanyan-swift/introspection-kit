//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE` file in the root directory of the repository this file is in.
//

extension TypeSchematic {

    // MARK: - TypeSchematic - PropertySelectionSchematic

    public var propertySelection: PropertySelectionSchematic {
        PropertySelectionSchematic(in: type)
    }
}

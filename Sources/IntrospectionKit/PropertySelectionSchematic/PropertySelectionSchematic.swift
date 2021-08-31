//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE` file in the root directory of the repository this file is in.
//

public struct PropertySelectionSchematic {

    // MARK: - PropertySelectionSchematic

    internal init(in aggregateType: Any.Type) {
        self.aggregateType = aggregateType
    }

    internal let aggregateType: Any.Type
}

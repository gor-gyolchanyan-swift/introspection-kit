//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE` file in the root directory of the repository this file is in.
//

extension PropertySelectionSchematic: Collection {

    // MARK: - Collection

    public var count: Int {
        Self._rawPropertyCount(_in: aggregateType)
    }

    // MARK: - Collection - Index

    public typealias Index = Int

    public var startIndex: Index {
        return .zero
    }

    public var endIndex: Index {
        return count
    }

    public func index(after anotherIndex: Index) -> Index {
        return anotherIndex + 1
    }

    public func index(_ anotherIndex: Index, offsetBy distance: Int) -> Index {
        return anotherIndex + distance
    }

    public func index(_ anotherIndex: Index, offsetBy distance: Int, limitedBy limit: Index) -> Index? {
        let resultingIndex = index(anotherIndex, offsetBy: distance)
        guard resultingIndex < limit else {
            return nil
        }
        return resultingIndex
    }

    // MARK: - Collection - Element

    public subscript(_ index: Index) -> Element {
        guard let element = Element(in: aggregateType, at: index) else {
            preconditionFailure("property index is out of range")
        }
        return element
    }
}

extension PropertySelectionSchematic {

    // MARK: - PropertySelectionSchematic - Raw

    @_silgen_name("swift_reflectionMirror_recursiveCount")
    private static func _rawPropertyCount(_in aggregateType: Any.Type) -> Int
}

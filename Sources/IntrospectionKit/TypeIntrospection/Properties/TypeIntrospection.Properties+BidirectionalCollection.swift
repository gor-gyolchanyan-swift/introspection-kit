//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE` file in the root directory of the repository this file is in.
//

extension TypeIntrospection.Properties: BidirectionalCollection {

    // MARK: BidirectionalCollection - Index

    public func index(before anotherIndex: Index) -> Index {
        return anotherIndex - 1
    }
}

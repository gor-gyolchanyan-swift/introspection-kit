//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE` file in the root directory of the repository this file is in.
//

extension PropertyIntrospection {

    // MARK: PropertyIntrospection - ID

    public struct ID: Hashable {

        // MARK: PropertyIntrospection.ID

        public init?(
            in type: TypeIntrospection,
            at index: Int
        ) {
            guard type.properties.indices.contains(index) else {
                return nil
            }
            self.type = type
            self.index = index
        }

        public let type: TypeIntrospection

        public let index: Int
    }
}

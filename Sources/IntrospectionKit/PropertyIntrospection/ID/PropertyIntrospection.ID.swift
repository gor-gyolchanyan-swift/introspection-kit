//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE` file in the root directory of the repository this file is in.
//

extension PropertyIntrospection {

    // MARK: PropertyIntrospection - ID

    public struct ID: Hashable {

        // MARK: PropertyIntrospection.ID

        public init?(
            in instanceType: TypeIntrospection,
            at index: Int
        ) {
            guard instanceType.properties.indices.contains(index) else {
                return nil
            }
            self.instanceType = instanceType
            self.index = index
        }

        public let instanceType: TypeIntrospection

        public let index: Int
    }
}

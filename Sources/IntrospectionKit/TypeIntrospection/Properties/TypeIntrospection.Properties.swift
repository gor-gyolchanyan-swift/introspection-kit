//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE` file in the root directory of the repository this file is in.
//

extension TypeIntrospection {

    // MARK: TypeIntrospection - Properties

    public struct Properties {

        // MARK: TypeIntrospection.Properties

        internal init(in instanceType: TypeIntrospection) {
            self.instanceType = instanceType
        }

        internal let instanceType: TypeIntrospection
    }
}

//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE` file in the root directory of the repository this file is in.
//

extension TypeIntrospection {

    // MARK: TypeIntrospection - Kind

    public enum Kind {

        // MARK: TypeIntrospection.Kind

        case classFromSwift

        case classFromObjectiveC

        case classFromC

        case structure

        case enumeration

        case optional

        case tuple

        case function

        case generic

        case typeForSpecific

        case typeForGeneric

        case opaque
    }
}

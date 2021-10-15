//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE` file in the root directory of the repository this file is in.
//

extension TypeIntrospection.Kind {

    // MARK: TypeIntrospection.Kind - Trait

    public var isClass: Bool {
        switch self {
            case
                .classFromSwift,
                .classFromObjectiveC,
                .classFromC:
                    return true
            case
                .structure,
                .enumeration,
                .optional,
                .tuple,
                .function,
                .generic,
                .typeForSpecific,
                .typeForGeneric,
                .opaque:
                    return false
        }
    }

    public var isGeneric: Bool {
        switch self {
            case
                .generic,
                .typeForGeneric:
                    return true
            case
                .classFromSwift,
                .classFromObjectiveC,
                .classFromC,
                .structure,
                .enumeration,
                .optional,
                .tuple,
                .function,
                .typeForSpecific,
                .opaque:
                    return false
        }
    }

    public var isType: Bool {
        switch self {
            case
                .typeForSpecific,
                .typeForGeneric:
                    return true
            case
                .classFromSwift,
                .classFromObjectiveC,
                .classFromC,
                .structure,
                .enumeration,
                .optional,
                .tuple,
                .function,
                .generic,
                .opaque:
                    return false
        }
    }

    public var isNominal: Bool {
        switch self {
            case
                .classFromSwift,
                .classFromObjectiveC,
                .classFromC,
                .structure,
                .enumeration,
                .optional:
                    return true
            case
                .tuple,
                .function,
                .generic,
                .typeForSpecific,
                .typeForGeneric,
                .opaque:
                    return false
        }
    }
}

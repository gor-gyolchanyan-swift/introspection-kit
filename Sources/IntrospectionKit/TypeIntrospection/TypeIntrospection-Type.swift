//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE` file in the root directory of the repository this file is in.
//

extension TypeIntrospection {

    // MARK: TypeIntrospection - Type

    public var typeForSpecific: TypeIntrospection {
        return TypeIntrospection(rawValue: Self._typeForSpecific(rawValue))
    }

    public var typeForGeneric: TypeIntrospection {
        return TypeIntrospection(rawValue: Self._typeForGeneric(rawValue))
    }
}

extension TypeIntrospection {

    // MARK: TypeIntrospection - Raw

    @_silgen_name("swift_getMetatypeMetadata")
    private static func _typeForSpecific(_ type: Any.Type) -> Any.Type

    @_silgen_name("swift_getExistentialMetatypeMetadata")
    private static func _typeForGeneric(_ type: Any.Type) -> Any.Type
}

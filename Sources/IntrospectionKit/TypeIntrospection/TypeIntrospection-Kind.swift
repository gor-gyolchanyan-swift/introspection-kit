//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE` file in the root directory of the repository this file is in.
//

extension TypeIntrospection {

    // MARK: TypeIntrospection - Kind

    public var kind: Kind {
        return Kind(rawValue: Self._rawKind(_of: rawValue)) ?? .opaque
    }
}

extension TypeIntrospection {

    // MARK: TypeIntrospection - Raw

    @_silgen_name("swift_getMetadataKind")
    private static func _rawKind(_of type: Any.Type) -> Kind.RawValue
}

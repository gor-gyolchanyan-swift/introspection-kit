//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE` file in the root directory of the repository this file is in.
//

extension TypeSchematic {

    // MARK: - TypeSchematic - Name

    public enum NameVariant {

        // MARK: - TypeSchematic.NameVariant

        case concise

        case extensive

        case inherent
    }

    public func name(_ variant: NameVariant) -> String {
        let rawName: _RawName
        switch variant {
            case .concise:
                rawName = Self._rawName(_of: type, _isExtended: false)
            case .extensive:
                rawName = Self._rawName(_of: type, _isExtended: true)
            case .inherent:
                rawName = Self._rawInherentName(_of: type)
        }
        return Self._name(_rawName: rawName)
    }
}

extension TypeSchematic {

    // MARK: - TypeSchematic - Raw

    private typealias _RawName = (start: UnsafePointer<UInt8>, count: Int)

    @_silgen_name("swift_getTypeName")
    private static func _rawName(_of type: Any.Type, _isExtended: Bool) -> _RawName

    @_silgen_name("swift_getMangledTypeName")
    private static func _rawInherentName(_of type: Any.Type) -> _RawName

    private static func _name(_rawName: _RawName) -> String {
        return String(
            decoding: UnsafeBufferPointer(
                start: _rawName.start,
                count: _rawName.count
            ),
            as: Unicode.UTF8.self
        )
    }
}

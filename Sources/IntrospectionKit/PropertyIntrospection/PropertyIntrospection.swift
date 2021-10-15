//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE` file in the root directory of the repository this file is in.
//

public struct PropertyIntrospection: Equatable, Identifiable {

    // MARK: PropertyIntrospection

    public init(id: ID) {
        self.id = id
        var rawConfiguration: _RawConfiguration = (
            _rawName: nil,
            _rawNameRelease: nil,
            _isStrong: false,
            _isMutable: false
        )
        let maybeType = Self._rawType(
            _in: id.type.rawValue,
            _at: id.index,
            _configuration: &rawConfiguration
        )
        guard let type = maybeType else {
            preconditionFailure("execution has reached a routine that is not supposed to be reachable")
        }
        self.type = TypeIntrospection(rawValue: type)
        let maybeName = rawConfiguration._rawName.map(String.init(cString:))
        guard let name = maybeName else {
            preconditionFailure("execution has reached a routine that is not supposed to be reachable")
        }
        self.name = name
        rawConfiguration._rawNameRelease?(rawConfiguration._rawName)
        self.offset = Self._rawOffset(_in: id.type.rawValue, _at: id.index)
        self.isStrong = rawConfiguration._isStrong
        self.isMutable = rawConfiguration._isMutable
    }

    public let name: String

    public let type: TypeIntrospection

    public let offset: Int

    public let isStrong: Bool

    public let isMutable: Bool

    // MARK: Identifiable

    public let id: ID
}

extension PropertyIntrospection {

    // MARK: PropertyIntrospection - Raw

    private typealias _RawName = UnsafePointer<CChar>

    private typealias _RawNameRelease = @convention(c) (_RawName?) -> Void

    private typealias _RawConfiguration = (_rawName: _RawName?, _rawNameRelease: _RawNameRelease?, _isStrong: Bool, _isMutable: Bool)

    @_silgen_name("swift_reflectionMirror_recursiveChildMetadata")
    private static func _rawType(_in enclosingType: Any.Type, _at index: Int, _configuration: UnsafeMutablePointer<_RawConfiguration>) -> Any.Type?

    @_silgen_name("swift_reflectionMirror_recursiveChildOffset")
    private static func _rawOffset(_in enclosingType: Any.Type, _at index: Int) -> Int
}

//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE` file in the root directory of the repository this file is in.
//

public struct PropertySchematic {

    // MARK: - PropertySchematic

    public init?(
        in aggregateType: Any.Type,
        at propertyIndex: Int
    ) {
        guard propertyIndex >= 0 else {
            return nil
        }
        var rawConfiguration: _RawConfiguration = (
            _rawName: nil,
            _rawNameRelease: nil,
            _isStrong: false,
            _isMutable: false
        )
        let maybeType = Self._rawType(
            _in: aggregateType,
            _at: propertyIndex,
            _configuration: &rawConfiguration
        )
        guard let type = maybeType else {
            return nil
        }
        self.type = type
        let maybeName = rawConfiguration._rawName.map(String.init(cString:))
        guard let name = maybeName else {
            return nil
        }
        self.name = name
        rawConfiguration._rawNameRelease?(rawConfiguration._rawName)
        self.offset = Self._rawOffset(_in: aggregateType, _at: propertyIndex)
        self.isStrong = rawConfiguration._isStrong
        self.isMutable = rawConfiguration._isMutable
    }

    public let name: String

    public let type: Any.Type

    public let offset: Int

    public let isStrong: Bool

    public let isMutable: Bool
}

extension PropertySchematic {

    // MARK: - PropertySchematic - Raw

    private typealias _RawName = UnsafePointer<CChar>

    private typealias _RawNameRelease = @convention(c) (_RawName?) -> Void

    private typealias _RawConfiguration = (_rawName: _RawName?, _rawNameRelease: _RawNameRelease?, _isStrong: Bool, _isMutable: Bool)

    @_silgen_name("swift_reflectionMirror_recursiveChildMetadata")
    private static func _rawType(_in aggregateType: Any.Type, _at propertyIndex: Int, _configuration: UnsafeMutablePointer<_RawConfiguration>) -> Any.Type?

    @_silgen_name("swift_reflectionMirror_recursiveChildOffset")
    private static func _rawOffset(_in aggregateType: Any.Type, _at propertyIndex: Int) -> Int
}

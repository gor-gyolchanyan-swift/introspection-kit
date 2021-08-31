//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE` file in the root directory of the repository this file is in.
//

extension TypeSchematic {

    // MARK: - TypeSchematic - Kind

    public var kind: Kind {
        let _rawKind = _RawKind(rawValue: Self._rawKindRawValue(_of: type))
        return Self._kind(_rawKind: _rawKind) ?? .opaque
    }
}

extension TypeSchematic {

    // MARK: - TypeSchematic - Raw

    fileprivate struct _RawKind: OptionSet, Equatable {

        // MARK: - RawRepresentable

        fileprivate typealias RawValue = UInt

        fileprivate init(rawValue: RawValue) {
            self.rawValue = rawValue
        }

        fileprivate var rawValue: RawValue
    }

    private static func _kind(_rawKind: _RawKind) -> Kind? {
        switch _rawKind {
            case .class:                     return .nominal(.class(.native))
            case .struct:                    return .nominal(.struct)
            case .enum:                      return .nominal(.enum)
            case .optional:                  return .nominal(.optional)
            case .foreignClass:              return .nominal(.class(.foreign))
            case .opaque:                    return .opaque
            case .tuple:                     return .structural(.tuple)
            case .function:                  return .structural(.function)
            case .existential:               return .structural(.existential)
            case .metatype:                  return .recurrent(.proper)
            case .objectiveCClassWrapper:    return .nominal(.class(.wrapper))
            case .existentialMetatype:       return .recurrent(.existential)
            default:                         return nil
        }
    }

    private static func _rawKind(_kind: Kind) -> _RawKind {
        switch _kind {
            case .nominal(.class(.native)):   return .class
            case .nominal(.struct):           return .struct
            case .nominal(.enum):             return .enum
            case .nominal(.optional):         return .optional
            case .nominal(.class(.foreign)):  return .foreignClass
            case .opaque:                     return .opaque
            case .structural(.tuple):         return .tuple
            case .structural(.function):      return .function
            case .structural(.existential):   return .existential
            case .recurrent(.proper):         return .metatype
            case .nominal(.class(.wrapper)):  return .objectiveCClassWrapper
            case .recurrent(.existential):    return .existentialMetatype
        }
    }

    @_silgen_name("swift_getMetadataKind")
    private static func _rawKindRawValue(_of type: Any.Type) -> _RawKind.RawValue
}

extension TypeSchematic._RawKind {

    // MARK: - TypeSchematic._RawKind - Standard - Trait

    fileprivate static let hasTrait_notPublic: Self = .init(rawValue: 0x100)

    fileprivate static let hasTrait_notOnHeap: Self = .init(rawValue: 0x200)

    fileprivate static let hasTrait_notAType: Self = .init(rawValue: 0x400)

    // MARK: - TypeSchematic._RawKind - Standard

    fileprivate static let `class`: Self = [.init(rawValue: 0)]

    fileprivate static let `struct`: Self = [.init(rawValue: 0), hasTrait_notOnHeap]

    fileprivate static let `enum`: Self = [.init(rawValue: 1), hasTrait_notOnHeap]

    fileprivate static let optional: Self = [.init(rawValue: 2), hasTrait_notOnHeap]

    fileprivate static let foreignClass: Self = [.init(rawValue: 3), hasTrait_notOnHeap]

    fileprivate static let opaque: Self = [.init(rawValue: 0), hasTrait_notPublic, hasTrait_notOnHeap]

    fileprivate static let tuple: Self = [.init(rawValue: 1), hasTrait_notPublic, hasTrait_notOnHeap]

    fileprivate static let function: Self = [.init(rawValue: 2), hasTrait_notPublic, hasTrait_notOnHeap]

    fileprivate static let existential: Self = [.init(rawValue: 3), hasTrait_notPublic, hasTrait_notOnHeap]

    fileprivate static let metatype: Self = [.init(rawValue: 4), hasTrait_notPublic, hasTrait_notOnHeap]

    fileprivate static let objectiveCClassWrapper: Self = [.init(rawValue: 5), hasTrait_notPublic, hasTrait_notOnHeap]

    fileprivate static let existentialMetatype: Self = [.init(rawValue: 6), hasTrait_notPublic, hasTrait_notOnHeap]

    fileprivate static let heapLocalVariable: Self = [.init(rawValue: 0), hasTrait_notAType]

    fileprivate static let heapGenericLocalVariable: Self = [.init(rawValue: 0), hasTrait_notPublic, hasTrait_notAType]

    fileprivate static let errorObject: Self = [.init(rawValue: 1), hasTrait_notPublic, hasTrait_notAType]

    fileprivate static let task: Self = [.init(rawValue: 2), hasTrait_notPublic, hasTrait_notAType]

    fileprivate static let job: Self = [.init(rawValue: 3), hasTrait_notPublic, hasTrait_notAType]
}

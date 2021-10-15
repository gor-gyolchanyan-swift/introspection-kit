//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE` file in the root directory of the repository this file is in.
//

extension TypeIntrospection.Kind {

    // MARK: TypeIntrospection.Kind - RawValue

    internal typealias RawValue = UInt

    internal init?(rawValue: RawValue) {
        let _intrinsic = _Intrinsic(rawValue: rawValue)
        switch _intrinsic {
            case .classFromSwift:       self = .classFromSwift
            case .classFromObjectiveC:  self = .classFromObjectiveC
            case .classFromC:           self = .classFromC
            case .structure:            self = .structure
            case .enumeration:          self = .enumeration
            case .optional:             self = .optional
            case .tuple:                self = .tuple
            case .function:             self = .function
            case .generic:              self = .generic
            case .typeOnSpecific:       self = .typeForSpecific
            case .typeOnGeneric:        self = .typeForGeneric
            case .opaque:               self = .opaque
            default:                    return nil
        }
    }

    internal var rawValue: RawValue {
        let _intrinsic: _Intrinsic
        switch self {
            case .classFromSwift:       _intrinsic = .classFromSwift
            case .classFromObjectiveC:  _intrinsic = .classFromObjectiveC
            case .classFromC:           _intrinsic = .classFromC
            case .structure:            _intrinsic = .structure
            case .enumeration:          _intrinsic = .enumeration
            case .optional:             _intrinsic = .optional
            case .tuple:                _intrinsic = .tuple
            case .function:             _intrinsic = .function
            case .generic:              _intrinsic = .generic
            case .typeForSpecific:      _intrinsic = .typeOnSpecific
            case .typeForGeneric:       _intrinsic = .typeOnGeneric
            case .opaque:               _intrinsic = .opaque
        }
        return _intrinsic.rawValue
    }
}

extension TypeIntrospection.Kind {

    // MARK: TypeIntrospection.Kind - _Intrinsic

    fileprivate struct _Intrinsic: OptionSet {

        // MARK: - RawRepresentable

        fileprivate init(rawValue: RawValue) {
            self.rawValue = rawValue
        }

        fileprivate let rawValue: RawValue
    }
}

extension TypeIntrospection.Kind._Intrinsic {

    // MARK: TypeIntrospection.Kind._Intrinsic - Trait

    fileprivate static let hasTrait_notPublic: Self = .init(rawValue: 0x100)

    fileprivate static let hasTrait_notOnHeap: Self = .init(rawValue: 0x200)

    fileprivate static let hasTrait_notAType: Self = .init(rawValue: 0x400)

    // MARK: TypeIntrospection.Kind._Intrinsic - Case

    fileprivate static let classFromSwift: Self = [.init(rawValue: 0)]

    fileprivate static let structure: Self = [.init(rawValue: 0), hasTrait_notOnHeap]

    fileprivate static let enumeration: Self = [.init(rawValue: 1), hasTrait_notOnHeap]

    fileprivate static let optional: Self = [.init(rawValue: 2), hasTrait_notOnHeap]

    fileprivate static let classFromC: Self = [.init(rawValue: 3), hasTrait_notOnHeap]

    fileprivate static let opaque: Self = [.init(rawValue: 0), hasTrait_notPublic, hasTrait_notOnHeap]

    fileprivate static let tuple: Self = [.init(rawValue: 1), hasTrait_notPublic, hasTrait_notOnHeap]

    fileprivate static let function: Self = [.init(rawValue: 2), hasTrait_notPublic, hasTrait_notOnHeap]

    fileprivate static let generic: Self = [.init(rawValue: 3), hasTrait_notPublic, hasTrait_notOnHeap]

    fileprivate static let typeOnSpecific: Self = [.init(rawValue: 4), hasTrait_notPublic, hasTrait_notOnHeap]

    fileprivate static let classFromObjectiveC: Self = [.init(rawValue: 5), hasTrait_notPublic, hasTrait_notOnHeap]

    fileprivate static let typeOnGeneric: Self = [.init(rawValue: 6), hasTrait_notPublic, hasTrait_notOnHeap]

    fileprivate static let specificHeapLocalVariable: Self = [.init(rawValue: 0), hasTrait_notAType]

    fileprivate static let genericHeapLocalVariable: Self = [.init(rawValue: 0), hasTrait_notPublic, hasTrait_notAType]

    fileprivate static let errorObject: Self = [.init(rawValue: 1), hasTrait_notPublic, hasTrait_notAType]

    fileprivate static let task: Self = [.init(rawValue: 2), hasTrait_notPublic, hasTrait_notAType]

    fileprivate static let job: Self = [.init(rawValue: 3), hasTrait_notPublic, hasTrait_notAType]
}

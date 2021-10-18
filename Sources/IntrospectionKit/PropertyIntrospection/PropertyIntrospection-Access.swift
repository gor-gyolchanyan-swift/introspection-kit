//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE` file in the root directory of the repository this file is in.
//

extension PropertyIntrospection {

    // MARK: PropertyIntrospection - Access

    public enum AccessError: Error {

        case wrongInstanceType

        case wrongValueType

        case isNotMutable
    }

    public func getValue<Instance>(in instance: Instance) throws -> Any {
        guard type(of: instance) == id.instanceType.rawValue else {
            throw AccessError.wrongInstanceType
        }
        return try Self._withRawPointer(_to: instance) { instanceInteriorPointer in
            func withProperValueType<ProperValue>(_: ProperValue.Type) throws -> ProperValue {
                let valuePointer = (instanceInteriorPointer + offset).bindMemory(to: ProperValue.self, capacity: 1)
                return valuePointer.pointee
            }
            return try _openExistential(valueType.rawValue, do: withProperValueType(_:))
        }
    }

    public func setValue<Instance, Value>(to value: Value, in instance: inout Instance) throws {
        guard type(of: instance) == id.instanceType.rawValue else {
            throw AccessError.wrongInstanceType
        }
        guard isMutable else {
            throw AccessError.isNotMutable
        }
        return try Self._withRawMutablePointer(_to: &instance) { instanceInteriorPointer in
            func withProperValueType<ProperValue>(_: ProperValue.Type) throws {
                guard let value = value as? ProperValue else {
                    throw AccessError.wrongValueType
                }
                let valuePointer = (instanceInteriorPointer + offset).bindMemory(to: ProperValue.self, capacity: 1)
                valuePointer.pointee = value
            }
            return try _openExistential(valueType.rawValue, do: withProperValueType(_:))
        }
    }
}

extension PropertyIntrospection {

    // MARK: PropertyIntrospection - Raw

    private static func _withRawPointer<Instance, RoutineSuccess>(
        _to instance: Instance,
        _execute routine: (UnsafeRawPointer) throws -> RoutineSuccess
    ) rethrows -> RoutineSuccess {
        let instanceType = type(of: instance)
        let isIndirectInstance = instanceType is AnyClass
        return try withUnsafePointer(to: instance) { instancePointer in
            let instanceInteriorPointer: UnsafeRawPointer
            if isIndirectInstance {
                return try instancePointer.withMemoryRebound(to: UnsafeRawPointer.self, capacity: 1) { instancePointer in
                    let instanceInteriorPointer = instancePointer.pointee
                    return try routine(instanceInteriorPointer)
                }
            } else {
                instanceInteriorPointer = UnsafeRawPointer(instancePointer)
                return try routine(instanceInteriorPointer)
            }
        }
    }

    private static func _withRawMutablePointer<Instance, RoutineSuccess>(
        _to instance: inout Instance,
        _execute routine: (UnsafeMutableRawPointer) throws -> RoutineSuccess
    ) rethrows -> RoutineSuccess {
        let instanceType = type(of: instance)
        let isIndirectInstance = instanceType is AnyClass
        return try withUnsafeMutablePointer(to: &instance) { instancePointer in
            let instanceInteriorPointer: UnsafeMutableRawPointer
            if isIndirectInstance {
                return try instancePointer.withMemoryRebound(to: UnsafeMutableRawPointer.self, capacity: 1) { instancePointer in
                    let instanceInteriorPointer = instancePointer.pointee
                    return try routine(instanceInteriorPointer)
                }
            } else {
                instanceInteriorPointer = UnsafeMutableRawPointer(instancePointer)
                return try routine(instanceInteriorPointer)
            }
        }
    }
}

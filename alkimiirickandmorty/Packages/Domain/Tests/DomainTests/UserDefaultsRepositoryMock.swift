//
//  UserDefaultsRepositoryMock.swift
//
//
//  Created by Guillermo Asencio Sanchez on 15/9/24.
//

@testable import Domain
import Foundation

class UserDefaultsRepositoryMock: UserDefaultsRepository {
    struct SetValueInvocation {
        let key: UserDefaultsKey
        let value: AnyObject

        func isEqualTo<T: Equatable>(tuple: (key: UserDefaultsKey, value: T)) -> Bool {
            return tuple.key == key &&
                tuple.value == value as? T
        }
    }

    public private(set) var getValuesInvocations: [UserDefaultsKey] = []
    public private(set) var setValuesInvocations: [SetValueInvocation] = []
    public var getValuesCallsCount: Int { getValuesInvocations.count }
    public var setValuesCallsCount: Int { setValuesInvocations.count }

    var setValuesInvocationsKeys: [UserDefaultsKey] {
        setValuesInvocations.map { $0.key }
    }

    var setValuesInvocationsValues: [AnyObject] {
        setValuesInvocations.map { $0.value }
    }

    var getValueReturnValue: [UserDefaultsKey: AnyObject?] = [:]

    func setValue<T>(value: T, key: UserDefaultsKey) {
        setValuesInvocations.append(SetValueInvocation(key: key, value: value as AnyObject))
        getValueReturnValue[key] = value as AnyObject
    }

    func getValue<T>(key: UserDefaultsKey) -> T? {
        getValuesInvocations.append(key)
        
        if getValueReturnValue.isEmpty {
            return nil
        }

        return getValueReturnValue[key] as? T
    }
}

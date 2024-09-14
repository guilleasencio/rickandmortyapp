// Generated using Sourcery 2.2.5 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable line_length
// swiftlint:disable variable_name

import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif


@testable import Domain























public class CharacterDetailsRepositoryMock: CharacterDetailsRepository {

    public init() {}



    //MARK: - getCharacterDetails

    public var getCharacterDetailsForIdStringCharacterThrowableError: (any Error)?
    public var getCharacterDetailsForIdStringCharacterCallsCount = 0
    public var getCharacterDetailsForIdStringCharacterCalled: Bool {
        return getCharacterDetailsForIdStringCharacterCallsCount > 0
    }
    public var getCharacterDetailsForIdStringCharacterReceivedId: (String)?
    public var getCharacterDetailsForIdStringCharacterReceivedInvocations: [(String)] = []
    public var getCharacterDetailsForIdStringCharacterReturnValue: Character!
    public var getCharacterDetailsForIdStringCharacterClosure: ((String) async throws -> Character)?

    public func getCharacterDetails(for id: String) async throws -> Character {
        getCharacterDetailsForIdStringCharacterCallsCount += 1
        getCharacterDetailsForIdStringCharacterReceivedId = id
        getCharacterDetailsForIdStringCharacterReceivedInvocations.append(id)
        if let error = getCharacterDetailsForIdStringCharacterThrowableError {
            throw error
        }
        if let getCharacterDetailsForIdStringCharacterClosure = getCharacterDetailsForIdStringCharacterClosure {
            return try await getCharacterDetailsForIdStringCharacterClosure(id)
        } else {
            return getCharacterDetailsForIdStringCharacterReturnValue
        }
    }


}
public class CharactersRepositoryMock: CharactersRepository {

    public init() {}



    //MARK: - getCharacters

    public var getCharactersForPageIntGenderCharacterGenderCharacterThrowableError: (any Error)?
    public var getCharactersForPageIntGenderCharacterGenderCharacterCallsCount = 0
    public var getCharactersForPageIntGenderCharacterGenderCharacterCalled: Bool {
        return getCharactersForPageIntGenderCharacterGenderCharacterCallsCount > 0
    }
    public var getCharactersForPageIntGenderCharacterGenderCharacterReceivedArguments: (page: Int, gender: Character.Gender)?
    public var getCharactersForPageIntGenderCharacterGenderCharacterReceivedInvocations: [(page: Int, gender: Character.Gender)] = []
    public var getCharactersForPageIntGenderCharacterGenderCharacterReturnValue: [Character]!
    public var getCharactersForPageIntGenderCharacterGenderCharacterClosure: ((Int, Character.Gender) async throws -> [Character])?

    public func getCharacters(for page: Int, gender: Character.Gender) async throws -> [Character] {
        getCharactersForPageIntGenderCharacterGenderCharacterCallsCount += 1
        getCharactersForPageIntGenderCharacterGenderCharacterReceivedArguments = (page: page, gender: gender)
        getCharactersForPageIntGenderCharacterGenderCharacterReceivedInvocations.append((page: page, gender: gender))
        if let error = getCharactersForPageIntGenderCharacterGenderCharacterThrowableError {
            throw error
        }
        if let getCharactersForPageIntGenderCharacterGenderCharacterClosure = getCharactersForPageIntGenderCharacterGenderCharacterClosure {
            return try await getCharactersForPageIntGenderCharacterGenderCharacterClosure(page, gender)
        } else {
            return getCharactersForPageIntGenderCharacterGenderCharacterReturnValue
        }
    }


}
public class GetCharacterDetailsUseCaseMock: GetCharacterDetailsUseCase {

    public init() {}



    //MARK: - callAsFunction

    public var callAsFunctionIdStringCharacterThrowableError: (any Error)?
    public var callAsFunctionIdStringCharacterCallsCount = 0
    public var callAsFunctionIdStringCharacterCalled: Bool {
        return callAsFunctionIdStringCharacterCallsCount > 0
    }
    public var callAsFunctionIdStringCharacterReceivedId: (String)?
    public var callAsFunctionIdStringCharacterReceivedInvocations: [(String)] = []
    public var callAsFunctionIdStringCharacterReturnValue: Character!
    public var callAsFunctionIdStringCharacterClosure: ((String) async throws -> Character)?

    public func callAsFunction(id: String) async throws -> Character {
        callAsFunctionIdStringCharacterCallsCount += 1
        callAsFunctionIdStringCharacterReceivedId = id
        callAsFunctionIdStringCharacterReceivedInvocations.append(id)
        if let error = callAsFunctionIdStringCharacterThrowableError {
            throw error
        }
        if let callAsFunctionIdStringCharacterClosure = callAsFunctionIdStringCharacterClosure {
            return try await callAsFunctionIdStringCharacterClosure(id)
        } else {
            return callAsFunctionIdStringCharacterReturnValue
        }
    }


}
public class GetCharactersUseCaseMock: GetCharactersUseCase {

    public init() {}



    //MARK: - callAsFunction

    public var callAsFunctionPageIntGenderCharacterGenderCharacterThrowableError: (any Error)?
    public var callAsFunctionPageIntGenderCharacterGenderCharacterCallsCount = 0
    public var callAsFunctionPageIntGenderCharacterGenderCharacterCalled: Bool {
        return callAsFunctionPageIntGenderCharacterGenderCharacterCallsCount > 0
    }
    public var callAsFunctionPageIntGenderCharacterGenderCharacterReceivedArguments: (page: Int, gender: Character.Gender)?
    public var callAsFunctionPageIntGenderCharacterGenderCharacterReceivedInvocations: [(page: Int, gender: Character.Gender)] = []
    public var callAsFunctionPageIntGenderCharacterGenderCharacterReturnValue: [Character]!
    public var callAsFunctionPageIntGenderCharacterGenderCharacterClosure: ((Int, Character.Gender) async throws -> [Character])?

    public func callAsFunction(page: Int, gender: Character.Gender) async throws -> [Character] {
        callAsFunctionPageIntGenderCharacterGenderCharacterCallsCount += 1
        callAsFunctionPageIntGenderCharacterGenderCharacterReceivedArguments = (page: page, gender: gender)
        callAsFunctionPageIntGenderCharacterGenderCharacterReceivedInvocations.append((page: page, gender: gender))
        if let error = callAsFunctionPageIntGenderCharacterGenderCharacterThrowableError {
            throw error
        }
        if let callAsFunctionPageIntGenderCharacterGenderCharacterClosure = callAsFunctionPageIntGenderCharacterGenderCharacterClosure {
            return try await callAsFunctionPageIntGenderCharacterGenderCharacterClosure(page, gender)
        } else {
            return callAsFunctionPageIntGenderCharacterGenderCharacterReturnValue
        }
    }


}
public class GetFavouriteCharactersUseCaseMock: GetFavouriteCharactersUseCase {

    public init() {}



    //MARK: - callAsFunction

    public var callAsFunctionStringCallsCount = 0
    public var callAsFunctionStringCalled: Bool {
        return callAsFunctionStringCallsCount > 0
    }
    public var callAsFunctionStringReturnValue: [String]!
    public var callAsFunctionStringClosure: (() -> [String])?

    public func callAsFunction() -> [String] {
        callAsFunctionStringCallsCount += 1
        if let callAsFunctionStringClosure = callAsFunctionStringClosure {
            return callAsFunctionStringClosure()
        } else {
            return callAsFunctionStringReturnValue
        }
    }


}
public class UpdateFavouriteCharactersUseCaseMock: UpdateFavouriteCharactersUseCase {

    public init() {}



    //MARK: - callAsFunction

    public var callAsFunctionCharacterStringVoidCallsCount = 0
    public var callAsFunctionCharacterStringVoidCalled: Bool {
        return callAsFunctionCharacterStringVoidCallsCount > 0
    }
    public var callAsFunctionCharacterStringVoidReceivedCharacter: (String)?
    public var callAsFunctionCharacterStringVoidReceivedInvocations: [(String)] = []
    public var callAsFunctionCharacterStringVoidClosure: ((String) -> Void)?

    public func callAsFunction(character: String) {
        callAsFunctionCharacterStringVoidCallsCount += 1
        callAsFunctionCharacterStringVoidReceivedCharacter = character
        callAsFunctionCharacterStringVoidReceivedInvocations.append(character)
        callAsFunctionCharacterStringVoidClosure?(character)
    }


}
public class UserDefaultsRepositoryMock: UserDefaultsRepository {

    public init() {}



    //MARK: - getValue<T>

    public var getValueTKeyUserDefaultsKeyTCallsCount = 0
    public var getValueTKeyUserDefaultsKeyTCalled: Bool {
        return getValueTKeyUserDefaultsKeyTCallsCount > 0
    }
    public var getValueTKeyUserDefaultsKeyTReceivedKey: (UserDefaultsKey)?
    public var getValueTKeyUserDefaultsKeyTReceivedInvocations: [(UserDefaultsKey)] = []
    public var getValueTKeyUserDefaultsKeyTReturnValue: T?
    public var getValueTKeyUserDefaultsKeyTClosure: ((UserDefaultsKey) -> T?)?

    public func getValue<T>(key: UserDefaultsKey) -> T? {
        getValueTKeyUserDefaultsKeyTCallsCount += 1
        getValueTKeyUserDefaultsKeyTReceivedKey = key
        getValueTKeyUserDefaultsKeyTReceivedInvocations.append(key)
        if let getValueTKeyUserDefaultsKeyTClosure = getValueTKeyUserDefaultsKeyTClosure {
            return getValueTKeyUserDefaultsKeyTClosure(key)
        } else {
            return getValueTKeyUserDefaultsKeyTReturnValue
        }
    }

    //MARK: - setValue<T>

    public var setValueTValueTKeyUserDefaultsKeyVoidCallsCount = 0
    public var setValueTValueTKeyUserDefaultsKeyVoidCalled: Bool {
        return setValueTValueTKeyUserDefaultsKeyVoidCallsCount > 0
    }
    public var setValueTValueTKeyUserDefaultsKeyVoidReceivedArguments: (value: T, key: UserDefaultsKey)?
    public var setValueTValueTKeyUserDefaultsKeyVoidReceivedInvocations: [(value: T, key: UserDefaultsKey)] = []
    public var setValueTValueTKeyUserDefaultsKeyVoidClosure: ((T, UserDefaultsKey) -> Void)?

    public func setValue<T>(value: T, key: UserDefaultsKey) {
        setValueTValueTKeyUserDefaultsKeyVoidCallsCount += 1
        setValueTValueTKeyUserDefaultsKeyVoidReceivedArguments = (value: value, key: key)
        setValueTValueTKeyUserDefaultsKeyVoidReceivedInvocations.append((value: value, key: key))
        setValueTValueTKeyUserDefaultsKeyVoidClosure?(value, key)
    }


}

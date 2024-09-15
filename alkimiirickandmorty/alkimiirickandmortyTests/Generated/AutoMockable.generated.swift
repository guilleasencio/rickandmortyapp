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

import Apollo

@testable import Data
@testable import Domain
@testable import GraphQL























class CharacterConverterMock: CharacterConverter {




    //MARK: - toDomain

    var toDomainDataCharacterDTOCharacterCallsCount = 0
    var toDomainDataCharacterDTOCharacterCalled: Bool {
        return toDomainDataCharacterDTOCharacterCallsCount > 0
    }
    var toDomainDataCharacterDTOCharacterReceivedData: (CharacterDTO)?
    var toDomainDataCharacterDTOCharacterReceivedInvocations: [(CharacterDTO)] = []
    var toDomainDataCharacterDTOCharacterReturnValue: Character!
    var toDomainDataCharacterDTOCharacterClosure: ((CharacterDTO) -> Character)?

    func toDomain(_ data: CharacterDTO) -> Character {
        toDomainDataCharacterDTOCharacterCallsCount += 1
        toDomainDataCharacterDTOCharacterReceivedData = data
        toDomainDataCharacterDTOCharacterReceivedInvocations.append(data)
        if let toDomainDataCharacterDTOCharacterClosure = toDomainDataCharacterDTOCharacterClosure {
            return toDomainDataCharacterDTOCharacterClosure(data)
        } else {
            return toDomainDataCharacterDTOCharacterReturnValue
        }
    }


}
public class CharacterDetailsDataSourceMock: CharacterDetailsDataSource {

    public init() {}



    //MARK: - getCharacterDetails

    public var getCharacterDetailsIdStringCharacterDTOThrowableError: (any Error)?
    public var getCharacterDetailsIdStringCharacterDTOCallsCount = 0
    public var getCharacterDetailsIdStringCharacterDTOCalled: Bool {
        return getCharacterDetailsIdStringCharacterDTOCallsCount > 0
    }
    public var getCharacterDetailsIdStringCharacterDTOReceivedId: (String)?
    public var getCharacterDetailsIdStringCharacterDTOReceivedInvocations: [(String)] = []
    public var getCharacterDetailsIdStringCharacterDTOReturnValue: CharacterDTO!
    public var getCharacterDetailsIdStringCharacterDTOClosure: ((String) async throws -> CharacterDTO)?

    public func getCharacterDetails(id: String) async throws -> CharacterDTO {
        getCharacterDetailsIdStringCharacterDTOCallsCount += 1
        getCharacterDetailsIdStringCharacterDTOReceivedId = id
        getCharacterDetailsIdStringCharacterDTOReceivedInvocations.append(id)
        if let error = getCharacterDetailsIdStringCharacterDTOThrowableError {
            throw error
        }
        if let getCharacterDetailsIdStringCharacterDTOClosure = getCharacterDetailsIdStringCharacterDTOClosure {
            return try await getCharacterDetailsIdStringCharacterDTOClosure(id)
        } else {
            return getCharacterDetailsIdStringCharacterDTOReturnValue
        }
    }


}
class CharacterDetailsQueryDataConverterMock: CharacterDetailsQueryDataConverter {




    //MARK: - toDto

    var toDtoDataAPIGetCharacterDetailsQueryDataCharacterDTOCallsCount = 0
    var toDtoDataAPIGetCharacterDetailsQueryDataCharacterDTOCalled: Bool {
        return toDtoDataAPIGetCharacterDetailsQueryDataCharacterDTOCallsCount > 0
    }
    var toDtoDataAPIGetCharacterDetailsQueryDataCharacterDTOReceivedData: (API.GetCharacterDetailsQuery.Data)?
    var toDtoDataAPIGetCharacterDetailsQueryDataCharacterDTOReceivedInvocations: [(API.GetCharacterDetailsQuery.Data)] = []
    var toDtoDataAPIGetCharacterDetailsQueryDataCharacterDTOReturnValue: CharacterDTO?
    var toDtoDataAPIGetCharacterDetailsQueryDataCharacterDTOClosure: ((API.GetCharacterDetailsQuery.Data) -> CharacterDTO?)?

    func toDto(_ data: API.GetCharacterDetailsQuery.Data) -> CharacterDTO? {
        toDtoDataAPIGetCharacterDetailsQueryDataCharacterDTOCallsCount += 1
        toDtoDataAPIGetCharacterDetailsQueryDataCharacterDTOReceivedData = data
        toDtoDataAPIGetCharacterDetailsQueryDataCharacterDTOReceivedInvocations.append(data)
        if let toDtoDataAPIGetCharacterDetailsQueryDataCharacterDTOClosure = toDtoDataAPIGetCharacterDetailsQueryDataCharacterDTOClosure {
            return toDtoDataAPIGetCharacterDetailsQueryDataCharacterDTOClosure(data)
        } else {
            return toDtoDataAPIGetCharacterDetailsQueryDataCharacterDTOReturnValue
        }
    }


}
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
public class CharactersDataSourceMock: CharactersDataSource {

    public init() {}



    //MARK: - getCharacters

    public var getCharactersPageIntGenderStringCharacterDTOThrowableError: (any Error)?
    public var getCharactersPageIntGenderStringCharacterDTOCallsCount = 0
    public var getCharactersPageIntGenderStringCharacterDTOCalled: Bool {
        return getCharactersPageIntGenderStringCharacterDTOCallsCount > 0
    }
    public var getCharactersPageIntGenderStringCharacterDTOReceivedArguments: (page: Int, gender: String)?
    public var getCharactersPageIntGenderStringCharacterDTOReceivedInvocations: [(page: Int, gender: String)] = []
    public var getCharactersPageIntGenderStringCharacterDTOReturnValue: [CharacterDTO]!
    public var getCharactersPageIntGenderStringCharacterDTOClosure: ((Int, String) async throws -> [CharacterDTO])?

    public func getCharacters(page: Int, gender: String) async throws -> [CharacterDTO] {
        getCharactersPageIntGenderStringCharacterDTOCallsCount += 1
        getCharactersPageIntGenderStringCharacterDTOReceivedArguments = (page: page, gender: gender)
        getCharactersPageIntGenderStringCharacterDTOReceivedInvocations.append((page: page, gender: gender))
        if let error = getCharactersPageIntGenderStringCharacterDTOThrowableError {
            throw error
        }
        if let getCharactersPageIntGenderStringCharacterDTOClosure = getCharactersPageIntGenderStringCharacterDTOClosure {
            return try await getCharactersPageIntGenderStringCharacterDTOClosure(page, gender)
        } else {
            return getCharactersPageIntGenderStringCharacterDTOReturnValue
        }
    }


}
class CharactersQueryDataConverterMock: CharactersQueryDataConverter {




    //MARK: - toDto

    var toDtoDataAPIGetCharactersQueryDataCharacterDTOCallsCount = 0
    var toDtoDataAPIGetCharactersQueryDataCharacterDTOCalled: Bool {
        return toDtoDataAPIGetCharactersQueryDataCharacterDTOCallsCount > 0
    }
    var toDtoDataAPIGetCharactersQueryDataCharacterDTOReceivedData: (API.GetCharactersQuery.Data)?
    var toDtoDataAPIGetCharactersQueryDataCharacterDTOReceivedInvocations: [(API.GetCharactersQuery.Data)] = []
    var toDtoDataAPIGetCharactersQueryDataCharacterDTOReturnValue: [CharacterDTO]!
    var toDtoDataAPIGetCharactersQueryDataCharacterDTOClosure: ((API.GetCharactersQuery.Data) -> [CharacterDTO])?

    func toDto(_ data: API.GetCharactersQuery.Data) -> [CharacterDTO] {
        toDtoDataAPIGetCharactersQueryDataCharacterDTOCallsCount += 1
        toDtoDataAPIGetCharactersQueryDataCharacterDTOReceivedData = data
        toDtoDataAPIGetCharactersQueryDataCharacterDTOReceivedInvocations.append(data)
        if let toDtoDataAPIGetCharactersQueryDataCharacterDTOClosure = toDtoDataAPIGetCharactersQueryDataCharacterDTOClosure {
            return toDtoDataAPIGetCharactersQueryDataCharacterDTOClosure(data)
        } else {
            return toDtoDataAPIGetCharactersQueryDataCharacterDTOReturnValue
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

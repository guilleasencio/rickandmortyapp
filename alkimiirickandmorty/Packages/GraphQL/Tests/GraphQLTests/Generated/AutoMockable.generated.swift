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

@testable import GraphQL























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

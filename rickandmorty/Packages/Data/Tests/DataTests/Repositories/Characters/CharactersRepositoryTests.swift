//
//  CharactersRepositoryTests.swift
//  
//
//  Created by Guillermo Asencio Sanchez on 15/9/24.
//

@testable import Data
import Domain
import GraphQL
import Foundation
import XCTest

final class CharactersRepositoryTests: XCTestCase {
    private var sut: CharactersRepositoryImplementation!
    private var charactersDataSourceMock: CharactersDataSourceMock!
    private var converterMock: CharacterConverterMock!
    
    // MARK: - Setup
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        charactersDataSourceMock = CharactersDataSourceMock()
        converterMock = CharacterConverterMock()
        sut = CharactersRepositoryImplementation(
            charactersDataSource: charactersDataSourceMock,
            converter: converterMock
        )
    }
    
    // MARK: - Tests
    
    func testsThatCharactersIsReturned_When_DataSourceReturnsValidData() async throws {
        let characterDtoMock = CharacterDTO(
            id: "1",
            name: "Rick",
            status: .alive,
            species: "",
            type: "",
            gender: .unknown,
            origin: nil,
            location: nil,
            image: "",
            episode: [],
            created: ""
        )
        charactersDataSourceMock.getCharactersPageIntGenderStringCharacterDTOReturnValue = [characterDtoMock]
        let characterMock = Character(
            id: "1",
            name: "Rick",
            status: .alive,
            species: "",
            type: "",
            gender: .unknown,
            origin: nil,
            location: nil,
            image: "",
            episode: [],
            created: ""
        )
        converterMock.toDomainDataCharacterDTOCharacterReturnValue = characterMock
        
        do {
            let result = try await sut.getCharacters(for: 1, gender: .all)
            
            XCTAssertEqual(1, charactersDataSourceMock.getCharactersPageIntGenderStringCharacterDTOCallsCount)
            XCTAssertEqual(1, converterMock.toDomainDataCharacterDTOCharacterCallsCount)
            XCTAssertEqual(1, result.count)
            XCTAssertEqual("1", result[0].id)
            XCTAssertEqual("Rick", result[0].name)
            XCTAssertEqual(.alive, result[0].status)
            XCTAssertEqual(.unknown, result[0].gender)
        } catch {
            XCTFail("It shouldn't enter here.")
        }
    }
    
    func testsThatErrorIsThrown_When_DataSourceFails() async throws {
        charactersDataSourceMock.getCharactersPageIntGenderStringCharacterDTOThrowableError = DataSourceError.missingResult(message: "error")
        
        do {
            _ = try await sut.getCharacters(for: 1, gender: .all)
            XCTFail("It should throw an error.")
        } catch let error as CustomError {
            XCTAssertEqual(1, charactersDataSourceMock.getCharactersPageIntGenderStringCharacterDTOCallsCount)
            XCTAssertEqual(0, converterMock.toDomainDataCharacterDTOCharacterCallsCount)
            XCTAssertEqual(.missingResult, error.errorCode)
            XCTAssertEqual("error", error.errorMessage)
        } catch {
            XCTFail("It should throw a CustomError object.")
        }
    }
}

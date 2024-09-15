//
//  CharacterDetailsRepositoryTests.swift
//
//
//  Created by Guillermo Asencio Sanchez on 15/9/24.
//

@testable import Data
import Domain
import GraphQL
import Foundation
import XCTest

final class CharacterDetailsRepositoryTests: XCTestCase {
    private var sut: CharacterDetailsRepositoryImplementation!
    private var characterDetailsDataSourceMock: CharacterDetailsDataSourceMock!
    private var converterMock: CharacterConverterMock!
    
    // MARK: - Setup
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        characterDetailsDataSourceMock = CharacterDetailsDataSourceMock()
        converterMock = CharacterConverterMock()
        sut = CharacterDetailsRepositoryImplementation(
            characterDetailsDataSource: characterDetailsDataSourceMock,
            converter: converterMock
        )
    }
    
    // MARK: - Tests
    
    func testsThatCharacterIsReturned_When_DataSourceReturnsValidData() async throws {
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
        characterDetailsDataSourceMock.getCharacterDetailsIdStringCharacterDTOReturnValue = characterDtoMock
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
            let result = try await sut.getCharacterDetails(for: "1")
            
            XCTAssertEqual(1, characterDetailsDataSourceMock.getCharacterDetailsIdStringCharacterDTOCallsCount)
            XCTAssertEqual(1, converterMock.toDomainDataCharacterDTOCharacterCallsCount)
            XCTAssertEqual("1", result.id)
            XCTAssertEqual("Rick", result.name)
            XCTAssertEqual(.alive, result.status)
            XCTAssertEqual(.unknown, result.gender)
        } catch {
            XCTFail("It shouldn't enter here.")
        }
    }
    
    func testsThatErrorIsThrown_When_DataSourceFails() async throws {
        characterDetailsDataSourceMock.getCharacterDetailsIdStringCharacterDTOThrowableError = DataSourceError.missingResult(message: "error")
        
        do {
            _ = try await sut.getCharacterDetails(for: "1")
            XCTFail("It should throw an error.")
        } catch let error as CustomError {
            XCTAssertEqual(1, characterDetailsDataSourceMock.getCharacterDetailsIdStringCharacterDTOCallsCount)
            XCTAssertEqual(0, converterMock.toDomainDataCharacterDTOCharacterCallsCount)
            XCTAssertEqual(.missingResult, error.errorCode)
            XCTAssertEqual("error", error.errorMessage)
        } catch {
            XCTFail("It should throw a CustomError object.")
        }
    }
}

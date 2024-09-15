//
//  GetCharacterDetailsUseCaseTests.swift
//
//
//  Created by Guillermo Asencio Sanchez on 15/9/24.
//

@testable import Domain
import Foundation
import XCTest

final class GetCharacterDetailsUseCaseTests: XCTestCase {
    private var sut: GetCharacterDetailsUseCaseImplementation!
    private var characterDetailsRepositoryMock: CharacterDetailsRepositoryMock!
    
    // MARK: - Setup
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        characterDetailsRepositoryMock = CharacterDetailsRepositoryMock()
        sut = GetCharacterDetailsUseCaseImplementation(characterDetailsRepository: characterDetailsRepositoryMock)
    }
    
    // MARK: - Tests
    
    func testsThatCharacterIsReturned_When_RepositorySuccess() async throws{
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
        characterDetailsRepositoryMock.getCharacterDetailsForIdStringCharacterReturnValue = characterMock
        do {
            let result = try await sut(id: "1")
            XCTAssertEqual(1, characterDetailsRepositoryMock.getCharacterDetailsForIdStringCharacterCallsCount)
            XCTAssertEqual("1", result.id)
            XCTAssertEqual("Rick", result.name)
            XCTAssertEqual(.alive, result.status)
            XCTAssertEqual(.unknown, result.gender)
        } catch {
            XCTFail("It shouldn't enter here.")
        }
    }
    
    func testsThatErrorIsThrown_When_RepositoryFails() async throws {
        characterDetailsRepositoryMock.getCharacterDetailsForIdStringCharacterThrowableError = CustomError(errorCode: .generic, errorMessage: "error")
        
        do {
            _ = try await sut(id: "1")
            XCTFail("It should throw an error.")
        } catch let error as CustomError {
            XCTAssertEqual(1, characterDetailsRepositoryMock.getCharacterDetailsForIdStringCharacterCallsCount)
            XCTAssertEqual(.generic, error.errorCode)
            XCTAssertEqual("error", error.errorMessage)
        } catch {
            XCTFail("It should throw a CustomError object.")
        }
    }
}

//
//  GetCharactersUseCaseTests.swift
//
//
//  Created by Guillermo Asencio Sanchez on 15/9/24.
//

@testable import Domain
import Foundation
import XCTest

final class GetCharactersUseCaseTests: XCTestCase {
    private var sut: GetCharactersUseCaseImplementation!
    private var charactersRepositoryMock: CharactersRepositoryMock!
    
    // MARK: - Setup
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        charactersRepositoryMock = CharactersRepositoryMock()
        sut = GetCharactersUseCaseImplementation(charactersRepository: charactersRepositoryMock)
    }
    
    // MARK: - Tests
    
    func testsThatCharactersIsReturned_When_RepositorySuccess() async throws{
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
        charactersRepositoryMock.getCharactersForPageIntGenderCharacterGenderCharacterReturnValue = [characterMock]
        do {
            let result = try await sut(page: 1, gender: .all)
            XCTAssertEqual(1, result.count)
            XCTAssertEqual("1", result[0].id)
            XCTAssertEqual("Rick", result[0].name)
            XCTAssertEqual(.alive, result[0].status)
            XCTAssertEqual(.unknown, result[0].gender)
        } catch {
            XCTFail("It shouldn't enter here.")
        }
    }
    
    func testsThatErrorIsThrown_When_RepositoryFails() async throws {
        charactersRepositoryMock.getCharactersForPageIntGenderCharacterGenderCharacterThrowableError = CustomError(errorCode: .generic, errorMessage: "error")
        
        do {
            _ = try await sut(page: 1, gender: .all)
            XCTFail("It should throw an error.")
        } catch let error as CustomError {
            XCTAssertEqual(1, charactersRepositoryMock.getCharactersForPageIntGenderCharacterGenderCharacterCallsCount)
            XCTAssertEqual(.generic, error.errorCode)
            XCTAssertEqual("error", error.errorMessage)
        } catch {
            XCTFail("It should throw a CustomError object.")
        }
    }
}

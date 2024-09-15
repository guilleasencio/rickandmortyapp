//
//  CharactersDataSourceTests.swift
//
//
//  Created by Guillermo Asencio Sanchez on 15/9/24.
//

import ApolloTestSupport
@testable import GraphQL
import Foundation
import XCTest

final class CharactersDataSourceTests: XCTestCase {
    private var sut: CharactersDataSourceImplementation!
    private var clientMock: GraphQLClientMock<API.GetCharactersQuery>!
    private var converterMock: CharactersQueryDataConverterMock!
    
    // MARK: - Setup
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        clientMock = GraphQLClientMock()
        converterMock = CharactersQueryDataConverterMock()
        sut = CharactersDataSourceImplementation(client: clientMock, converter: converterMock)
    }
    
    // MARK: - Tests
    
    func testCharactersAreReturned_When_GetCharactersIsCalled_And_ResultIsSuccess() async throws {
        let queryMock = Mock<Query>(
            characters: Mock<Characters>(
                results: [
                    Mock<Character>(
                        id: "1",
                        name: "Rick"
                    ),
                    Mock<Character>(
                        id: "2",
                        name: "Morty"
                    )
                ]
            )
        )
        let model = API.GetCharactersQuery.Data.from(queryMock)
        clientMock.queryBlock = { success, _ in
            success(model)
        }
        converterMock.toDtoDataAPIGetCharactersQueryDataCharacterDTOReturnValue = [
            CharacterDTO(
                id: "1",
                name: "Rick",
                status: .unknown,
                species: "",
                type: "",
                gender: .unknown,
                origin: nil,
                location: nil,
                image: "",
                episode: [],
                created: nil
            ),
            CharacterDTO(
                id: "2",
                name: "Morty",
                status: .unknown,
                species: "",
                type: "",
                gender: .unknown,
                origin: nil,
                location: nil,
                image: "",
                episode: [],
                created: nil
            )
        ]
        do {
            let result = try await sut.getCharacters(page: 1, gender: "")
            
            XCTAssertEqual(1, clientMock.queryCallsCount)
            XCTAssertEqual(1, converterMock.toDtoDataAPIGetCharactersQueryDataCharacterDTOCallsCount)
            XCTAssertEqual(2, result.count)
            XCTAssertEqual("Rick", result[0].name)
            XCTAssertEqual("Morty", result[1].name)
        } catch {
            XCTFail("It shouldn't enter here.")
        }
    }
    
    func testErrorIsReturned_When_GetCharactersIsCalled_And_ResultIsFailure() async throws {
        clientMock.queryBlock = { _ , failure in
            failure(.missingResult(message: "error"))
        }
        
        do {
            _  = try await sut.getCharacters(page: 1, gender: "")
            XCTFail("It should throw an error.")
        } catch let error as DataSourceError {
            XCTAssertEqual(1, clientMock.queryCallsCount)
            XCTAssertEqual(0, converterMock.toDtoDataAPIGetCharactersQueryDataCharacterDTOCallsCount)
            XCTAssertEqual(.missingResult(message: "error"), error)
        }
    }
}

//
//  CharacterDetailsDataSourceTests.swift
//
//
//  Created by Guillermo Asencio Sanchez on 14/9/24.
//

import ApolloTestSupport
@testable import GraphQL
import Foundation
import XCTest

final class CharacterDetailsDataSourceTests: XCTestCase {
    private var sut: CharacterDetailsDataSourceImplementation!
    private var clientMock: GraphQLClientMock<API.GetCharacterDetailsQuery>!
    private var converterMock: CharacterDetailsQueryDataConverterMock!
    
    // MARK: - Setup
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        clientMock = GraphQLClientMock()
        converterMock = CharacterDetailsQueryDataConverterMock()
        sut = CharacterDetailsDataSourceImplementation(client: clientMock, converter: converterMock)
    }
    
    // MARK: - Tests
    
    func testCharacterDataIsReturned_When_GetCharacterDetailsIsCalled_And_ResultIsSuccess() async throws {
        let queryMock = Mock<Query>(
            character: Mock<Character>(
                id: "1",
                name: "Rick"
            )
        )
        let model = API.GetCharacterDetailsQuery.Data.from(queryMock)
        clientMock.queryBlock = { success, _ in
            success(model)
        }
        converterMock.toDtoDataAPIGetCharacterDetailsQueryDataCharacterDTOReturnValue = CharacterDTO(
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
        )
        
        let result = try await sut.getCharacterDetails(id: "1")
        
        XCTAssertEqual(1, clientMock.queryCallsCount)
        XCTAssertEqual(1, converterMock.toDtoDataAPIGetCharacterDetailsQueryDataCharacterDTOCallsCount)
        XCTAssertEqual("1", result.id)
        XCTAssertEqual("Rick", result.name)
    }
    
    func testErrorIsReturned_When_GetCharacterDetailsIsCalled_And_ResultIsFailure() async throws {
        clientMock.queryBlock = { _ , failure in
            failure(.missingResult(message: "error"))
        }
        
        do {
            _  = try await sut.getCharacterDetails(id: "1")
        } catch let error as DataSourceError {
            XCTAssertEqual(1, clientMock.queryCallsCount)
            XCTAssertEqual(0, converterMock.toDtoDataAPIGetCharacterDetailsQueryDataCharacterDTOCallsCount)
            XCTAssertEqual(.missingResult(message: "error"), error)
        }
    }
}

//
//  UpdateFavouriteCharactersUseCaseTests.swift
//
//
//  Created by Guillermo Asencio Sanchez on 15/9/24.
//

import Foundation

@testable import Domain
import Foundation
import XCTest

final class UpdateFavouriteCharactersUseCaseTests: XCTestCase {
    private var sut: UpdateFavouriteCharactersUseCaseImplementation!
    private var userDefaultsRepositoryMock: UserDefaultsRepositoryMock!
    
    // MARK: - Setup
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        userDefaultsRepositoryMock = UserDefaultsRepositoryMock()
        
        sut = UpdateFavouriteCharactersUseCaseImplementation(userDefaultsRepository: userDefaultsRepositoryMock)
    }
    
    // MARK: - Tests
    
    func testThatANewFavoriteIsStored_When_CharacterWasNotInFavoritesPreviously() throws {
        let newFavorite = "2"
        userDefaultsRepositoryMock.getValueReturnValue = [
            .characterFavoutites: ["1"] as AnyObject
        ]
        
        let previousFavorites: [String] = try XCTUnwrap(userDefaultsRepositoryMock.getValue(key: .characterFavoutites))
        XCTAssertFalse(previousFavorites.contains(newFavorite))
        
        sut(character: newFavorite)
        
        XCTAssertEqual(1, userDefaultsRepositoryMock.setValuesCallsCount)
        
        let newFavorites: [String] = try XCTUnwrap(userDefaultsRepositoryMock.getValue(key: .characterFavoutites))
        XCTAssertTrue(newFavorites.contains(newFavorite))
    }
    
    func testThatAFavoriteIsRemoved_When_CharacterWasAlreadyInFavoritesPreviously() throws {
        let newFavorite = "2"
        userDefaultsRepositoryMock.getValueReturnValue = [
            .characterFavoutites: ["1", "2"] as AnyObject
        ]
        
        let previousFavorites: [String] = try XCTUnwrap(userDefaultsRepositoryMock.getValue(key: .characterFavoutites))
        XCTAssertTrue(previousFavorites.contains(newFavorite))
        
        sut(character: newFavorite)
        
        XCTAssertEqual(1, userDefaultsRepositoryMock.setValuesCallsCount)
        
        let newFavorites: [String] = try XCTUnwrap(userDefaultsRepositoryMock.getValue(key: .characterFavoutites))
        XCTAssertFalse(newFavorites.contains(newFavorite))
    }
}

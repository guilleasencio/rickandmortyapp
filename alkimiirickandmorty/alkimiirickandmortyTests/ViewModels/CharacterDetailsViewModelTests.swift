//
//  CharacterDetailsViewModelTests.swift
//  alkimiirickandmortyTests
//
//  Created by Guillermo Asencio Sanchez on 15/9/24.
//

@testable import alkimiirickandmorty
import Domain
import XCTest

final class CharacterDetailsViewModelTests: XCTestCase {
    private var sut: CharacterDetailsViewModel!
    private var updateFavouriteCharactersUseCaseMock: UpdateFavouriteCharactersUseCaseMock!
    
    // MARK: - Setup
    
    override func setUpWithError() throws {
        try super.setUpWithError()
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
        updateFavouriteCharactersUseCaseMock = UpdateFavouriteCharactersUseCaseMock()
        
        sut = CharacterDetailsViewModel(
            character: characterMock,
            isFavourite: false,
            updateFavouriteCharactersUseCase: updateFavouriteCharactersUseCaseMock
        )
    }
    
    // MARK: - Tests
    
    func testThatUpdateFavouriteCharactersUseCaseIsCalled_When_UpdateFavouriteIsCalled() {
        sut.updateFavourite()
        
        XCTAssertEqual(1, updateFavouriteCharactersUseCaseMock.callAsFunctionCharacterStringVoidCallsCount)
    }
    
}

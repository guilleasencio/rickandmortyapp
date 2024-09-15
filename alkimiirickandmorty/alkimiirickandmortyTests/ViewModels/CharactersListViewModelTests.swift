//
//  CharactersListViewModelTests.swift
//  alkimiirickandmortyTests
//
//  Created by Guillermo Asencio Sanchez on 15/9/24.
//

@testable import alkimiirickandmorty
import Domain
import XCTest

final class CharactersListViewModelTests: XCTestCase {
    private var sut: CharactersListViewModel!
    private var getCharactersUseCaseMock: GetCharactersUseCaseMock!
    private var getCharacterDetailsUseCaseMock: GetCharacterDetailsUseCaseMock!
    private var getFavouriteCharactersUseCaseMock: GetFavouriteCharactersUseCaseMock!
    
    
    // MARK: - Setup
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        getCharactersUseCaseMock = GetCharactersUseCaseMock()
        getCharacterDetailsUseCaseMock = GetCharacterDetailsUseCaseMock()
        getFavouriteCharactersUseCaseMock = GetFavouriteCharactersUseCaseMock()
        getFavouriteCharactersUseCaseMock.callAsFunctionStringReturnValue = []
        
        sut = CharactersListViewModel(
            getCharactersUseCase: getCharactersUseCaseMock,
            getCharacterDetailsUseCase: getCharacterDetailsUseCaseMock,
            getFavouriteCharactersUseCase: getFavouriteCharactersUseCaseMock
        )
    }
    
    // MARK: - Tests
    
    func testThatLoadDataIsSuccessed_When_GetCharactersUseCaseSucesses() async {
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
        getCharactersUseCaseMock.callAsFunctionPageIntGenderCharacterGenderCharacterReturnValue = [characterMock]
        
        await sut.loadData()
        
        XCTAssertEqual(1, getCharactersUseCaseMock.callAsFunctionPageIntGenderCharacterGenderCharacterCallsCount)
        XCTAssertEqual(1, getFavouriteCharactersUseCaseMock.callAsFunctionStringCallsCount)
        XCTAssertTrue(sut.characters.contains(where: { characterMock == $0 }))
    }
    
    func testThatViewModelCannotLoadMoreData_When_GetCharactersUseCaseFails() async {
        getCharactersUseCaseMock.callAsFunctionPageIntGenderCharacterGenderCharacterThrowableError = CustomError(errorCode: .generic, errorMessage: "error")
        
        await sut.loadData()
        
        XCTAssertEqual(1, getCharactersUseCaseMock.callAsFunctionPageIntGenderCharacterGenderCharacterCallsCount)
        XCTAssertEqual(1, getFavouriteCharactersUseCaseMock.callAsFunctionStringCallsCount)
        XCTAssertTrue(sut.characters.isEmpty)
        XCTAssertFalse(sut.hasMoreData)
        XCTAssertEqual(.idle, sut.state)
    }
    
    func testThatCharactersArrayIsEmpty_When_ANewGenderFilterIsSet() async {
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
        getCharactersUseCaseMock.callAsFunctionPageIntGenderCharacterGenderCharacterReturnValue = [characterMock]
        
        await sut.loadData()
        
        XCTAssertFalse(sut.characters.isEmpty)
        
        sut.setGender(newGender: .unknown)
        
        XCTAssertTrue(sut.characters.isEmpty)
        XCTAssertEqual(1, sut.page)
        XCTAssertTrue(sut.hasMoreData)
    }
    
    func testThatGetCharacterDetailsUseCaseIsCalled_When_GetCharactersDetailsIsCalled_And_CharacterIsNotStored() async {
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
        getCharactersUseCaseMock.callAsFunctionPageIntGenderCharacterGenderCharacterReturnValue = [characterMock]
        let character2Mock = Character(
            id: "2",
            name: "Morty",
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
        getCharacterDetailsUseCaseMock.callAsFunctionIdStringCharacterReturnValue = character2Mock
        
        await sut.loadData()
        
        await sut.getCharacterDetails(by: "2")
        
        XCTAssertEqual(1, getCharacterDetailsUseCaseMock.callAsFunctionIdStringCharacterCallsCount)
        XCTAssertEqual(character2Mock, sut.selectedCharacter)
    }
    
    func testThatGetCharacterDetailsUseCaseIsNotCalled_When_GetCharactersDetailsIsCalled_And_CharacterIsAlreadyStored() async {
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
        getCharactersUseCaseMock.callAsFunctionPageIntGenderCharacterGenderCharacterReturnValue = [characterMock]
        
        await sut.loadData()
        
        await sut.getCharacterDetails(by: "1")
        
        XCTAssertEqual(0, getCharacterDetailsUseCaseMock.callAsFunctionIdStringCharacterCallsCount)
        XCTAssertEqual(characterMock, sut.selectedCharacter)
    }
    
    func testThatAnErrorWillBeShown_When_GetCharactersDetailsUseCaseIsCalled_And_Fails() async {
        getCharacterDetailsUseCaseMock.callAsFunctionIdStringCharacterThrowableError = CustomError(errorCode: .generic, errorMessage: "error")
        
        await sut.getCharacterDetails(by: "2")
        
        XCTAssertEqual(1, getCharacterDetailsUseCaseMock.callAsFunctionIdStringCharacterCallsCount)
        XCTAssertNil(sut.selectedCharacter)
        XCTAssertTrue(sut.showError)
    }
    
    func testThatGetFavouritesUseCaseIsCalled_When_RefreshFavouritesCharactersIsCalled() {
        sut.refreshFavouritesCharacters()
        
        XCTAssertEqual(1, getFavouriteCharactersUseCaseMock.callAsFunctionStringCallsCount)
    }
}

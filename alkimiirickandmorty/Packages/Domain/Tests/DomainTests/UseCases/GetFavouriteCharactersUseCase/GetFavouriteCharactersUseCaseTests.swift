//
//  GetFavouriteCharactersUseCaseTests.swift
//  
//
//  Created by Guillermo Asencio Sanchez on 15/9/24.
//

import Foundation

@testable import Domain
import Foundation
import XCTest

final class GetFavouriteCharactersUseCaseTests: XCTestCase {
    private var sut: GetFavouriteCharactersUseCaseImplementation!
    private var userDefaultsRepositoryMock: UserDefaultsRepositoryMock!
    
    // MARK: - Setup
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        userDefaultsRepositoryMock = UserDefaultsRepositoryMock()
        
        sut = GetFavouriteCharactersUseCaseImplementation(userDefaultsRepository: userDefaultsRepositoryMock)
    }
    
    // MARK: - Tests
    
    func testThatANotEmptyArrayIsReturn_When_ThereAreFavoritesStored() {
        userDefaultsRepositoryMock.getValueReturnValue = [
            .characterFavoutites: ["1"] as AnyObject
        ]
        
        let result = sut()
        
        XCTAssertEqual(1, userDefaultsRepositoryMock.getValuesCallsCount)
        XCTAssertEqual(1, result.count)
        XCTAssertEqual("1", result[0])
    }
    
    func testThatAEmptyArrayIsReturn_When_ThereAreNotFavoritesStored() {
        userDefaultsRepositoryMock.getValueReturnValue = [:]
        
        let result = sut()
        
        XCTAssertEqual(1, userDefaultsRepositoryMock.getValuesCallsCount)
        XCTAssertTrue(result.isEmpty)
    }
}

//
//  GetCharactersUseCase.swift
//
//
//  Created by Guillermo Asencio Sanchez on 10/9/24.
//

import Foundation

public protocol GetCharactersUseCase: AutoMockable {
    func callAsFunction(page: Int, gender: Character.Gender) async throws -> [Character]
}

final class GetCharactersUseCaseImplementation: GetCharactersUseCase {
    private let charactersRepository: CharactersRepository
    
    init(charactersRepository: CharactersRepository) {
        self.charactersRepository = charactersRepository
    }
    
    func callAsFunction(page: Int, gender: Character.Gender) async throws -> [Character] {
        try await charactersRepository.getCharacters(for: page, gender: gender)
    }
}

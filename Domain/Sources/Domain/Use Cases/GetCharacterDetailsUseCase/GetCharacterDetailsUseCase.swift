//
//  GetCharacterDetailsUseCase.swift
//  
//
//  Created by Guillermo Asencio Sanchez on 14/9/24.
//

import Foundation

public protocol GetCharacterDetailsUseCase {
    func callAsFunction(id: String) async throws -> Character
}

final class GetCharacterDetailsUseCaseImplementation: GetCharacterDetailsUseCase {
    private let characterDetailsRepository: CharacterDetailsRepository
    
    init(characterDetailsRepository: CharacterDetailsRepository) {
        self.characterDetailsRepository = characterDetailsRepository
    }
    
    func callAsFunction(id: String) async throws -> Character {
        try await characterDetailsRepository.getCharacterDetails(for: id)
    }
}

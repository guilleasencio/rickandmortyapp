//
//  GetCharacterDetailsUseCaseFactory.swift
//
//
//  Created by Guillermo Asencio Sanchez on 14/9/24.
//

import Foundation

public enum GetCharacterDetailsUseCaseFactory {
    public static func make(characterDetailsRepository: CharacterDetailsRepository) -> GetCharacterDetailsUseCase {
        GetCharacterDetailsUseCaseImplementation(characterDetailsRepository: characterDetailsRepository)
    }
}

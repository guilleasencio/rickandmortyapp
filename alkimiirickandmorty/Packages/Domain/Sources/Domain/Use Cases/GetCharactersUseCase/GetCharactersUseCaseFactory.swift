//
//  GetCharactersUseCaseFactory.swift
//
//
//  Created by Guillermo Asencio Sanchez on 10/9/24.
//

import Foundation

public enum GetCharactersUseCaseFactory {
    public static func make(charactersRepository: CharactersRepository) -> GetCharactersUseCase {
        GetCharactersUseCaseImplementation(charactersRepository: charactersRepository)
    }
}

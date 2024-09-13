//
//  GetFavouriteCharactersUseCaseFactory.swift
//  
//
//  Created by Guillermo Asencio Sanchez on 13/9/24.
//

import Foundation

public enum GetFavouriteCharactersUseCaseFactory {
    public static func make(userDefaultsRepository: UserDefaultsRepository) -> GetFavouriteCharactersUseCase {
        GetFavouriteCharactersUseCaseImplementation(userDefaultsRepository: userDefaultsRepository)
    }
}

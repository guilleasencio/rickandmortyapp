//
//  UpdateFavouriteCharactersUseCaseFactory.swift
//
//
//  Created by Guillermo Asencio Sanchez on 13/9/24.
//

import Foundation

public enum UpdateFavouriteCharactersUseCaseFactory {
    public static func make(userDefaultsRepository: UserDefaultsRepository) -> UpdateFavouriteCharactersUseCase {
        UpdateFavouriteCharactersUseCaseImplementation(userDefaultsRepository: userDefaultsRepository)
    }
}

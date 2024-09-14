//
//  AppViewModelFactory.swift
//  alkimiirickandmorty
//
//  Created by Guillermo Asencio Sanchez on 14/9/24.
//

import Domain
import Data
import Foundation

enum AppViewModelFactory {
    static func make() -> AppViewModel {
        let characterDetailsRepository = CharacterDetailsRepositoryFactory.make()
        let getCharacterDetailsUseCase = GetCharacterDetailsUseCaseFactory.make(characterDetailsRepository: characterDetailsRepository)
        
        let userDefaultsRepository = UserDefaultsRepositoryFactory.make(userDefaults: UserDefaults.standard)
        let getFavouriteCharactersUseCase = GetFavouriteCharactersUseCaseFactory.make(userDefaultsRepository: userDefaultsRepository)
        
        return AppViewModel(
            getCharacterDetailsUseCase: getCharacterDetailsUseCase,
            getFavouriteCharactersUseCase: getFavouriteCharactersUseCase
        )
    }
}

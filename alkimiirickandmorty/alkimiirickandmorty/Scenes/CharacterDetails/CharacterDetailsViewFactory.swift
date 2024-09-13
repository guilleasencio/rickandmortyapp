//
//  CharacterDetailsViewFactory.swift
//  alkimiirickandmorty
//
//  Created by Guillermo Asencio Sanchez on 12/9/24.
//

import Data
import Domain
import Foundation

enum CharacterDetailsViewFactory {
    static func make(character: Character, isFavourite: Bool) -> CharacterDetailsView {
        let userDefaultsRepository = UserDefaultsRepositoryFactory.make(userDefaults: UserDefaults.standard)
        let updateFavouriteCharactersUseCase = UpdateFavouriteCharactersUseCaseFactory.make(userDefaultsRepository: userDefaultsRepository)
        let viewModel = CharacterDetailsViewModel(
            character: character,
            isFavourite: isFavourite,
            updateFavouriteCharactersUseCase: updateFavouriteCharactersUseCase
        )
        return CharacterDetailsView(viewModel: viewModel)
    }
}

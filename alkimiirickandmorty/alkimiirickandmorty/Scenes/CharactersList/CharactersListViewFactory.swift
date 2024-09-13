//
//  CharactersListViewFactory.swift
//  alkimiirickandmorty
//
//  Created by Guillermo Asencio Sanchez on 12/9/24.
//

import Data
import Domain
import Foundation

enum CharactersListViewFactory {
    static func make() -> CharactersListView {
        let charactersRepository = CharactersRepositoryFactory.make()
        let getCharactersUseCase = GetCharactersUseCaseFactory.make(charactersRepository: charactersRepository)
        let userDefaultsRepository = UserDefaultsRepositoryFactory.make(userDefaults: UserDefaults.standard)
        let getFavouriteCharactersUseCase = GetFavouriteCharactersUseCaseFactory.make(userDefaultsRepository: userDefaultsRepository)
        let viewModel = CharactersListViewModel(
            getCharactersUseCase: getCharactersUseCase,
            getFavouriteCharactersUseCase: getFavouriteCharactersUseCase
        )
        return CharactersListView(viewModel: viewModel)
    }
}

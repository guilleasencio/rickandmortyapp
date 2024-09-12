//
//  CharacterListViewFactory.swift
//  alkimiirickandmorty
//
//  Created by Guillermo Asencio Sanchez on 12/9/24.
//

import Data
import Domain
import Foundation

enum CharacterListViewFactory {
    static func make() -> CharactersListView {
        let charactersRepository = CharactersRepositoryFactory.make()
        let getCharactersUseCase = GetCharactersUseCaseFactory.make(charactersRepository: charactersRepository)
        let viewModel = CharacterListViewModel(getCharactersUseCase: getCharactersUseCase)
        return CharactersListView(viewModel: viewModel)
    }
}

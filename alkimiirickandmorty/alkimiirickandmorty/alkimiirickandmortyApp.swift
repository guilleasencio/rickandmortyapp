//
//  alkimiirickandmortyApp.swift
//  alkimiirickandmorty
//
//  Created by Guillermo Asencio Sanchez on 9/9/24.
//

import Data
import Domain
import SwiftUI

@main
struct alkimiirickandmortyApp: App {
    var body: some Scene {
        WindowGroup {
            let charactersRepository = CharactersRepositoryFactory.make()
            let getCharactersUseCase = GetCharactersUseCaseFactory.make(charactersRepository: charactersRepository)
            let viewModel = CharacterListViewModel(getCharactersUseCase: getCharactersUseCase)
            return CharactersListView(viewModel: viewModel)
        }
    }
}

//
//  CharactersListView.swift
//  alkimiirickandmorty
//
//  Created by Guillermo Asencio Sanchez on 10/9/24.
//

import Data
import Domain
import SwiftUI

struct CharactersListView: View {
    @ObservedObject var viewModel: CharacterListViewModel
    
    init(viewModel: CharacterListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List {
            ForEach(viewModel.characters, id: \.id) { character in
                CharactersListItemView(character: character)
            }
        }.onAppear {
            Task { @MainActor in
                await viewModel.onAppear()
            }
        }
    }
}

#Preview {
    let charactersRepository = CharactersRepositoryFactory.make()
    let getCharactersUseCase = GetCharactersUseCaseFactory.make(charactersRepository: charactersRepository)
    let viewModel = CharacterListViewModel(getCharactersUseCase: getCharactersUseCase)
    return CharactersListView(viewModel: viewModel)
}

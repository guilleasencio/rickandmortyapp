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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear {
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

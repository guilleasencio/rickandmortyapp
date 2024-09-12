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
        NavigationView {
            List() {
                ForEach(viewModel.characters, id: \.id) { character in
                    CharactersListItemView(character: character)
                        .listRowSeparator(.hidden)
                }
                .listRowInsets(EdgeInsets.init(.zero))
                if viewModel.hasMoreData {
                    loadMoreRow()
                }
            }
            .navigationTitle("Characters")
            .onAppear {
                Task { @MainActor in
                    await viewModel.loadData()
                }
            }
        }
    }
    
    @ViewBuilder
    private func loadMoreRow() -> some View {
        ZStack(alignment: .center) {
            switch viewModel.loadState {
                case .isLoading:
                    HStack(alignment: .center) {
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                case .idle:
                    EmptyView()
                }
            }
            .frame(height: 50)
            .onAppear {
                Task { @MainActor in
                    await viewModel.loadData()
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

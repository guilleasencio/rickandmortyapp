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
    @ObservedObject var viewModel: CharactersListViewModel
    @State var gender: Character.Gender = .all
    
    init(viewModel: CharactersListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    genderFilter()
                    Spacer()
                }
                if viewModel.loadState == .pendingToInit {
                    ProgressView()
                } else {
                    List() {
                        Section {
                            ForEach(viewModel.characters, id: \.id) { character in
                                CharactersListItemView(
                                    character: character,
                                    isFavourite: viewModel.favouriteCharacters.contains(character.id)
                                )
                                    .listRowSeparator(.hidden)
                                    .overlay {
                                        NavigationLink(
                                            character.id,
                                            destination: CharacterDetailsViewFactory.make(
                                                character: character,
                                                isFavourite: viewModel.favouriteCharacters.contains(character.id)
                                            )
                                        )
                                        .opacity(0)
                                    }
                            }
                            .listRowInsets(EdgeInsets.init(.zero))
                            if viewModel.hasMoreData {
                                loadMoreRow()
                            }
                        }
                    }
                }
            }
            .navigationTitle("Characters")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                Task { @MainActor in
                    await viewModel.loadData()
                }
            }
        }
        // Deeplinking Handling
        .onOpenURL { incomingURL in
            Task { @MainActor in
                await handleDeeplink(incomingURL)
            }
        }
        .sheet(isPresented: $viewModel.hasToPresentDeeplink) {
            if let character = viewModel.selectedCharacter {
                CharacterDetailsViewFactory.make(
                    character: character,
                    isFavourite: viewModel.favouriteCharacters.contains(character.id)
                )
            }
        }
        .alert(isPresented: $viewModel.showError, error: viewModel.error) { _ in
            Button("OK") {
                viewModel.showError = false
                viewModel.error = nil
            }
        } message: { error in
            Text(error.errorMessage)
        }
    }
    
    @ViewBuilder
    private func genderFilter() -> some View {
        HStack {
            Text("Filter by Gender:")
                .font(.system(size: 18.0))
                .foregroundColor(.black)
            Picker("Gender", selection: $gender) {
                ForEach(Character.Gender.allCases) { gender in
                    Text(gender.rawValue)
                        .tag(gender)
                }
            }
            .onChange(of: gender) { oldValue, newValue in
                viewModel.setGender(newGender: newValue)
            }
            .pickerStyle(.menu)
            .tint(.black)
        }
        .textCase(.none)
    }
    
    @ViewBuilder
    private func loadMoreRow() -> some View {
        ZStack(alignment: .center) {
            switch viewModel.loadState {
            case .pendingToInit, .isLoading:
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

// MARK: - Deeplink handler

extension CharactersListView {
    @MainActor
    private func handleDeeplink(_ url: URL) async {
        guard url.scheme == "alkimiirickandmorty" else {
            return
        }
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            print("Invalid URL")
            return
        }
        
        guard let action = components.host, action == "character" else {
            print("Unknown URL, we can't handle this one!")
            return
        }
        
        let pathElements = components.path.components(separatedBy: "/").filter({ !$0.isEmpty })
        
        guard pathElements.count == 1 else {
            print("Invalid path format")
            return
        }
        
        await viewModel.getCharacterDetails(by: pathElements[0])
    }
}

#Preview {
    let charactersRepository = CharactersRepositoryFactory.make()
    let getCharactersUseCase = GetCharactersUseCaseFactory.make(charactersRepository: charactersRepository)
    
    let characterDetailsRepository = CharacterDetailsRepositoryFactory.make()
    let getCharacterDetailsUseCase = GetCharacterDetailsUseCaseFactory.make(characterDetailsRepository: characterDetailsRepository)
    
    let userDefaultsRepository = UserDefaultsRepositoryFactory.make(userDefaults: UserDefaults.standard)
    let getFavouriteCharactersUseCase = GetFavouriteCharactersUseCaseFactory.make(userDefaultsRepository: userDefaultsRepository)
    
    let viewModel = CharactersListViewModel(
        getCharactersUseCase: getCharactersUseCase, 
        getCharacterDetailsUseCase: getCharacterDetailsUseCase,
        getFavouriteCharactersUseCase: getFavouriteCharactersUseCase
    )
    return CharactersListView(viewModel: viewModel)
}

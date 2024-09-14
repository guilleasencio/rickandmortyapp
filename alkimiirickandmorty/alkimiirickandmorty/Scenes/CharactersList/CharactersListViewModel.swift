//
//  CharactersListViewModel.swift
//  alkimiirickandmorty
//
//  Created by Guillermo Asencio Sanchez on 10/9/24.
//

import Domain
import Foundation

enum LoadState {
    case pendingToInit
    case isLoading
    case idle
}

class CharactersListViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var page: Int = 1
    @Published var hasMoreData: Bool = true
    @Published var loadState: LoadState = .pendingToInit
    @Published var favouriteCharacters: [String] = []
    
    // Deeplink
    @Published var hasToPresentDeeplink: Bool = false
    @Published var showError: Bool = false
    var selectedCharacter: Character?
    var error: CustomError? = nil
    
    private var gender: Character.Gender = .all
    
    private let getCharactersUseCase: GetCharactersUseCase
    private let getCharacterDetailsUseCase: GetCharacterDetailsUseCase
    private let getFavouriteCharactersUseCase: GetFavouriteCharactersUseCase
    
    init(
        getCharactersUseCase: GetCharactersUseCase,
        getCharacterDetailsUseCase: GetCharacterDetailsUseCase,
        getFavouriteCharactersUseCase: GetFavouriteCharactersUseCase
    ) {
        self.getCharactersUseCase = getCharactersUseCase
        self.getCharacterDetailsUseCase = getCharacterDetailsUseCase
        self.getFavouriteCharactersUseCase = getFavouriteCharactersUseCase
    }
    
    @MainActor
    func loadData() async {
        do {
            loadState = .isLoading
            favouriteCharacters = getFavouriteCharactersUseCase()
            let newCharacters = try await getCharactersUseCase(page: page, gender: gender)
            characters.append(contentsOf: newCharacters)
            loadState = .idle
            hasMoreData = !newCharacters.isEmpty
            page += 1
        } catch {
            loadState = .idle
            hasMoreData = false
        }
    }

    func setGender(newGender: Character.Gender) {
        gender = newGender
        characters = []
        page = 1
        hasMoreData = true
        loadState = .idle
    }
    
    @MainActor
    func getCharacterDetails(by id: String) async {
        if let character = characters.first(where: { $0.id == id}) {
            selectedCharacter = character
            hasToPresentDeeplink = true
        } else {
            selectedCharacter = nil
            do {
                selectedCharacter = try await getCharacterDetailsUseCase(id: id)
                hasToPresentDeeplink = true
            } catch let error as CustomError {
                showError = true
                self.error = error
            } catch let error {
                showError = true
                self.error = CustomError(
                    errorCode: .generic,
                    errorMessage: error.localizedDescription
                )
            }
        }
    }
}

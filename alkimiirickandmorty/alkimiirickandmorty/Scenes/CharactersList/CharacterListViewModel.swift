//
//  CharacterListViewModel.swift
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

class CharacterListViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var page: Int = 1
    @Published var hasMoreData: Bool = true
    @Published var loadState: LoadState = .pendingToInit
    
    private var gender: Character.Gender = .all
    
    private let getCharactersUseCase: GetCharactersUseCase
    
    init(getCharactersUseCase: GetCharactersUseCase) {
        self.getCharactersUseCase = getCharactersUseCase
    }
    
    @MainActor
    func loadData() async {
        do {
            loadState = .isLoading
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
}

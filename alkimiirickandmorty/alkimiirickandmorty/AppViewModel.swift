//
//  AppViewModel.swift
//  alkimiirickandmorty
//
//  Created by Guillermo Asencio Sanchez on 14/9/24.
//

import Domain
import Foundation

class AppViewModel: ObservableObject {
    @Published var hasToPresentDeeplink: Bool = false
    @Published var showError: Bool = false
    
    var character: Character?
    var favouriteCharacters: [String] = []
    var error: CustomError? = nil
    
    private let getCharacterDetailsUseCase: GetCharacterDetailsUseCase
    private let getFavouriteCharactersUseCase: GetFavouriteCharactersUseCase
    
    init(
        getCharacterDetailsUseCase: GetCharacterDetailsUseCase,
        getFavouriteCharactersUseCase: GetFavouriteCharactersUseCase
    ) {
        self.getCharacterDetailsUseCase = getCharacterDetailsUseCase
        self.getFavouriteCharactersUseCase = getFavouriteCharactersUseCase
    }
    
    @MainActor
    func getCharacterDetails(by id: String) async {
        character = nil
        favouriteCharacters = getFavouriteCharactersUseCase()
        do {
            character = try await getCharacterDetailsUseCase(id: id)
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

//
//  CharacterDetailsViewModel.swift
//  alkimiirickandmorty
//
//  Created by Guillermo Asencio Sanchez on 12/9/24.
//

import Domain
import Foundation

class CharacterDetailsViewModel: ObservableObject {
    @Published var character: Character
    @Published var isFavourite: Bool
    
    private let updateFavouriteCharactersUseCase: UpdateFavouriteCharactersUseCase
    
    init(
        character: Character,
        isFavourite: Bool,
        updateFavouriteCharactersUseCase: UpdateFavouriteCharactersUseCase
    ) {
        self.character = character
        self.isFavourite = isFavourite
        self.updateFavouriteCharactersUseCase = updateFavouriteCharactersUseCase
    }
    
    func updateFavourite() {
        isFavourite.toggle()
        updateFavouriteCharactersUseCase(character: character.id)
    }
}

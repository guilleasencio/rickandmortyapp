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
    
    init(character: Character) {
        self.character = character
    }
}

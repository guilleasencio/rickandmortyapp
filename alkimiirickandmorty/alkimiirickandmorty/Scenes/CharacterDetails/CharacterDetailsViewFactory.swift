//
//  CharacterDetailsViewFactory.swift
//  alkimiirickandmorty
//
//  Created by Guillermo Asencio Sanchez on 12/9/24.
//

import Domain
import Foundation

enum CharacterDetailsViewFactory {
    static func make(character: Character) -> CharacterDetailsView {
        let viewModel = CharacterDetailsViewModel(character: character)
        return CharacterDetailsView(viewModel: viewModel)
    }
}

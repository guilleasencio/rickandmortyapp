//
//  UpdateFavouriteCharactersUseCase.swift
//
//
//  Created by Guillermo Asencio Sanchez on 13/9/24.
//

import Foundation

public protocol UpdateFavouriteCharactersUseCase {
    func callAsFunction(character: String)
}

class UpdateFavouriteCharactersUseCaseImplementation: UpdateFavouriteCharactersUseCase {
    private var userDefaultsRepository: UserDefaultsRepository
    
    init(userDefaultsRepository: UserDefaultsRepository) {
        self.userDefaultsRepository = userDefaultsRepository
    }
    
    func callAsFunction(character: String) {
        var favourites: [String] = userDefaultsRepository.getValue(key: .characterFavoutites) ?? []
        if let index = favourites.firstIndex(of: character) {
            favourites.remove(at: index)
        } else {
            favourites.append(character)
        }
        userDefaultsRepository.setValue(value: favourites, key: .characterFavoutites)
    }
}

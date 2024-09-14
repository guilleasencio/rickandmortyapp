//
//  GetFavouriteCharactersUseCase.swift
//
//
//  Created by Guillermo Asencio Sanchez on 13/9/24.
//

import Foundation

public protocol GetFavouriteCharactersUseCase {
    func callAsFunction() -> [String]
}

class GetFavouriteCharactersUseCaseImplementation: GetFavouriteCharactersUseCase {
    private var userDefaultsRepository: UserDefaultsRepository
    
    init(userDefaultsRepository: UserDefaultsRepository) {
        self.userDefaultsRepository = userDefaultsRepository
    }
    
    func callAsFunction() -> [String] {
        let favourites: [String] = userDefaultsRepository.getValue(key: .characterFavoutites) ?? []
        return favourites
    }
}

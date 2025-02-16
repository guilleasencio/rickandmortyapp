//
//  CharactersDataSource.swift
//  rickandmorty
//
//  Created by Guillermo Asencio Sanchez on 10/9/24.
//

import Foundation

public protocol CharactersDataSource: AutoMockable {
    func getCharacters(page: Int, gender: String) async throws -> [CharacterDTO]
}

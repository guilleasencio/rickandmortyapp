//
//  CharactersRepository.swift
//
//
//  Created by Guillermo Asencio Sanchez on 10/9/24.
//

import Foundation

public protocol CharactersRepository {
    func getCharacters(for page: Int, gender: Character.Gender) async throws -> [Character]
}

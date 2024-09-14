//
//  CharacterDetailsDataSource.swift
//  alkimiirickandmorty
//
//  Created by Guillermo Asencio Sanchez on 10/9/24.
//

import Foundation

public protocol CharacterDetailsDataSource {
    func getCharacterDetails(id: String) async throws -> CharacterDTO
}

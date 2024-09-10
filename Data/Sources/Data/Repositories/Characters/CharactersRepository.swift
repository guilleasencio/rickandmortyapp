//
//  CharactersRepository.swift
//  
//
//  Created by Guillermo Asencio Sanchez on 10/9/24.
//

import Domain
import GraphQL
import Foundation

class CharactersRepositoryImplementation: CharactersRepository {
    private let charactersDataSource: CharactersDataSource
    private let converter: CharacterConverter
    
    init(charactersDataSource: CharactersDataSource, converter: CharacterConverter) {
        self.charactersDataSource = charactersDataSource
        self.converter = converter
    }
    
    func getCharacters(for page: Int, gender: Character.Gender?) async throws -> [Character] {
        do {
            let genderName: String = gender?.rawValue ?? ""
            let charactersDto = try await charactersDataSource.getCharacters(page: page, gender: genderName)
            return charactersDto.compactMap({ converter.toDomain($0) })
        } catch let error as DataSourceError {
            throw error.toCustomError()
        }
    }
}

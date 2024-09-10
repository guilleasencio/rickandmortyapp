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
    private let converter: GetCharactersQueryDataConverter
    
    init(charactersDataSource: CharactersDataSource, converter: GetCharactersQueryDataConverter) {
        self.charactersDataSource = charactersDataSource
        self.converter = converter
    }
    
    func getCharacters(for page: Int, gender: Character.Gender) async throws -> [Character] {
        do {
            let charactersDto = try await charactersDataSource.getCharacters(page: page, gender: gender.rawValue)
            return converter.toDomain(charactersDto)
        } catch let error as DataSourceError {
            throw error.toCustomError()
        }
    }
}

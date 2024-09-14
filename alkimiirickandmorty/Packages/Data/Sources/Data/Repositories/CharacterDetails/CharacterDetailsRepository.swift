//
//  CharacterDetailsRepository.swift
//
//
//  Created by Guillermo Asencio Sanchez on 14/9/24.
//

import Domain
import GraphQL
import Foundation

class CharacterDetailsRepositoryImplementation: CharacterDetailsRepository {
    private let characterDetailsDataSource: CharacterDetailsDataSource
    private let converter: CharacterConverter
    
    init(characterDetailsDataSource: CharacterDetailsDataSource, converter: CharacterConverter) {
        self.characterDetailsDataSource = characterDetailsDataSource
        self.converter = converter
    }
    
    func getCharacterDetails(for id: String) async throws -> Character {
        do {
            let characterDto = try await characterDetailsDataSource.getCharacterDetails(id: id)
            return converter.toDomain(characterDto)
        } catch let error as DataSourceError {
            throw error.toCustomError()
        }
    }
}

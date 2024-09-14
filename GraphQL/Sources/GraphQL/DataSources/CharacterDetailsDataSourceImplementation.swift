//
//  CharacterDetailsDataSourceImplementation.swift
//
//
//  Created by Guillermo Asencio Sanchez on 14/9/24.
//

import Foundation

struct CharacterDetailsDataSourceImplementation: CharacterDetailsDataSource {
    
    
    private let client: GraphQLClient
    private let converter: CharactersDetailsQueryDataConverter
    
    init(client: GraphQLClient, converter: CharactersDetailsQueryDataConverter) {
        self.client = client
        self.converter = converter
    }
    
    func getCharacterDetails(id: String) async throws -> CharacterDTO {
        return try await withCheckedThrowingContinuation { continuation in
            client.query(query: API.GetCharacterDetailsQuery(id: id),
                         onSuccess: { data in
                            guard let character = converter.toDto(data) else {
                                let error: DataSourceError = .parseError(message: "Error parsing information from GetCharacterDetails")
                                continuation.resume(throwing: error)
                                return
                            }
                            continuation.resume(returning: character)
                        },
                         onFailure: { error in
                            continuation.resume(throwing: error)
                        }
            )
        }
    }
}

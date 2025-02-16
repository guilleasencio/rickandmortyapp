//
//  CharactersDataSourceImplementation.swift
//
//
//  Created by Guillermo Asencio Sanchez on 10/9/24.
//

import Foundation

struct CharactersDataSourceImplementation: CharactersDataSource {    
    private let client: GraphQLClient
    private let converter: CharactersQueryDataConverter
    
    init(client: GraphQLClient, converter: CharactersQueryDataConverter) {
        self.client = client
        self.converter = converter
    }
    
    func getCharacters(page: Int, gender: String) async throws -> [CharacterDTO] {
        return try await withCheckedThrowingContinuation { continuation in
            client.query(query: API.GetCharactersQuery(page: page, gender: gender), 
                         onSuccess: { data in
                            let characters = converter.toDto(data)
                            continuation.resume(returning: characters)
                        },
                        onFailure: { error in
                            continuation.resume(throwing: error)
                
                        }
            )
        }
    }
}

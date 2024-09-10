//
//  CharactersDataSourceImplementation.swift
//
//
//  Created by Guillermo Asencio Sanchez on 10/9/24.
//

import Foundation

struct CharactersDataSourceImplementation: CharactersDataSource {
    private let client: GraphQLClient
    
    init(client: GraphQLClient) {
        self.client = client
    }
    
    func getCharacters(page: Int, gender: String) async throws -> API.GetCharactersQuery.Data {
        return try await withCheckedThrowingContinuation { continuation in
            client.query(query: API.GetCharactersQuery(page: page, gender: gender), 
                         onSuccess: { data in
                            continuation.resume(returning: data)
                        },
                        onFailure: { error in
                            continuation.resume(throwing: error)
                
                        }
            )
        }
    }
}

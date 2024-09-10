//
//  CharactersDataSourceFactory.swift
//
//
//  Created by Guillermo Asencio Sanchez on 10/9/24.
//

import Foundation

public enum CharactersDataSourceFactory {
    func make() -> CharactersDataSource {
        let client = GraphQLClientFactory.make()
        return CharactersDataSourceImplementation(client: client)
    }
}

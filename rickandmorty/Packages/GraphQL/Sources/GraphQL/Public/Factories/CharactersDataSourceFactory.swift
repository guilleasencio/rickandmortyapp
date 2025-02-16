//
//  CharactersDataSourceFactory.swift
//
//
//  Created by Guillermo Asencio Sanchez on 10/9/24.
//

import Foundation

public enum CharactersDataSourceFactory {
    public static func make() -> CharactersDataSource {
        let client: GraphQLClient = GraphQLClientFactory.make()
        let converter: CharactersQueryDataConverter = CharactersQueryDataConverterImplementation()
        return CharactersDataSourceImplementation(client: client, converter: converter)
    }
}

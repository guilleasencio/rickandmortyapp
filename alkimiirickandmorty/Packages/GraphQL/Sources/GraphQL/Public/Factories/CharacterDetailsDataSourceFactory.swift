//
//  CharacterDetailsDataSourceFactory.swift
//
//
//  Created by Guillermo Asencio Sanchez on 14/9/24.
//

import Foundation

public enum CharacterDetailsDataSourceFactory {
    public static func make() -> CharacterDetailsDataSource {
        let client: GraphQLClient = GraphQLClientFactory.make()
        let converter: CharacterDetailsQueryDataConverter = CharacterDetailsQueryDataConverterImplementation()
        return CharacterDetailsDataSourceImplementation(client: client, converter: converter)
    }
}

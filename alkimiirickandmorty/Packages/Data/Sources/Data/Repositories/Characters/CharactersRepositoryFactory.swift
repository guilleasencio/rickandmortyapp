//
//  CharactersRepositoryFactory.swift
//
//
//  Created by Guillermo Asencio Sanchez on 10/9/24.
//

import Domain
import GraphQL

public enum CharactersRepositoryFactory {
    public static func make() -> CharactersRepository {
        let charactersDataSource: CharactersDataSource = CharactersDataSourceFactory.make()
        let converter: CharacterConverter = CharacterConverterImplementation()
        return CharactersRepositoryImplementation(charactersDataSource: charactersDataSource, converter: converter)
    }
}

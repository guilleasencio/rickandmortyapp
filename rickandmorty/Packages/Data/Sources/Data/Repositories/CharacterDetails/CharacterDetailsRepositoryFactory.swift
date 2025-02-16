//
//  CharacterDetailsRepositoryFactory.swift
//
//
//  Created by Guillermo Asencio Sanchez on 14/9/24.
//

import Domain
import GraphQL

public enum CharacterDetailsRepositoryFactory {
    public static func make() -> CharacterDetailsRepository {
        let characterDetailsDataSource: CharacterDetailsDataSource = CharacterDetailsDataSourceFactory.make()
        let converter: CharacterConverter = CharacterConverterImplementation()
        return CharacterDetailsRepositoryImplementation(
            characterDetailsDataSource: characterDetailsDataSource,
            converter: converter
        )
    }
}

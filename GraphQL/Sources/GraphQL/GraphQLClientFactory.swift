//
//  GraphQLClientFactory.swift
//  alkimiirickandmorty
//
//  Created by Guillermo Asencio Sanchez on 10/9/24.
//

import Foundation

enum GraphQLClientFactory {
    func make() -> GraphQLClient {
        let url: URL = BackendConfig.baseUrl
        let apolloClient = ApolloClientWrapper(endpointUrl: url)
        return GraphQLClientImplementation(apolloClient: apolloClient)
    }
}

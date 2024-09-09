//
//  GraphQLClient.swift
//  alkimiirickandmorty
//
//  Created by Guillermo Asencio Sanchez on 9/9/24.
//

import Apollo

protocol GraphQLClient {
    func query<Query: GraphQLQuery>(query: Query) async
}

class GraphQLClientImplementation: GraphQLClient {
    private let apolloClient: ApolloClientWrapper
    
    init(apolloClient: ApolloClientWrapper) {
        self.apolloClient = apolloClient
    }
    
    func query<Query>(query: Query) async where Query : GraphQLQuery {
        apolloClient.fetch(query: query)
    }
}

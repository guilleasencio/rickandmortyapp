//
//  GraphQLClient.swift
//  alkimiirickandmorty
//
//  Created by Guillermo Asencio Sanchez on 9/9/24.
//

import Apollo

protocol GraphQLClient {
    func query<Query: GraphQLQuery>(query: Query,
                                    onSuccess: @escaping (Query.Data) -> Void,
                                    onFailure: @escaping (DataSourceError) -> Void)
}

class GraphQLClientImplementation: GraphQLClient {
    private let apolloClient: ApolloClientWrapper
    
    init(apolloClient: ApolloClientWrapper) {
        self.apolloClient = apolloClient
    }
    
    func query<Query: GraphQLQuery>(query: Query,
                                    onSuccess: @escaping (Query.Data) -> Void,
                                    onFailure: @escaping (DataSourceError) -> Void) {
        apolloClient.fetch(query: query, resultHandler: { result in
            switch result {
            case let .success(GraphQLResult):
                guard let data = GraphQLResult.data else {
                    onFailure(.missingResult(message: "Error in the GraphQL Result Data"))
                    return
                }

                onSuccess(data)
            case let .failure(error):
                onFailure(.clientError(error: error))
            }
        })
    }
}

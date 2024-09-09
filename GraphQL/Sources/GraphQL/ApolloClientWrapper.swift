//
//  ApolloClientWrapper.swift
//  alkimiirickandmorty
//
//  Created by Guillermo Asencio Sanchez on 9/9/24.
//

import Apollo
import Foundation

class ApolloClientWrapper {
    private let endpointUrl: URL
    
    init(endpointUrl: URL) {
        self.endpointUrl = endpointUrl
    }
    
    private lazy var apollo: ApolloClient = {
        ApolloClient(url: endpointUrl)
    }()
    
    @discardableResult 
    func fetch<Query: GraphQLQuery>(query: Query,
                                    cachePolicy: CachePolicy = .default,
                                    contextIdentifier: UUID? = nil,
                                    context: (any RequestContext)? = nil,
                                    queue: DispatchQueue = .main,
                                    resultHandler: GraphQLResultHandler<Query.Data>? = nil) -> Cancellable {
        apollo.fetch(query: query,
                     cachePolicy: cachePolicy,
                     contextIdentifier: contextIdentifier,
                     queue: queue,
                     resultHandler: resultHandler)
    }
}

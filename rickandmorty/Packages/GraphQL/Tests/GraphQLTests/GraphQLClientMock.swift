//
//  GraphQLClientMock.swift
//
//
//  Created by Guillermo Asencio Sanchez on 14/9/24.
//

import Apollo
@testable import GraphQL
import Foundation

class GraphQLClientMock<QueryClassType>: GraphQLClient where QueryClassType: GraphQLQuery {
    let errorMock = DataSourceError.clientError(error: DataSourceError.missingResult(message: "error"))

    var queryReceived: QueryClassType?

    var isQueryCalled = false

    var queryCallsCount = 0

    var queryBlock: (((QueryClassType.Data) -> Void, (DataSourceError) -> Void) -> Void)?

    var parameters: [String: Any]?

    func query<Query: GraphQLQuery>(query: Query,
                                    onSuccess: @escaping (Query.Data) -> Void,
                                    onFailure: @escaping (DataSourceError) -> Void) {
        isQueryCalled = true
        queryCallsCount += 1
        queryReceived = query as? QueryClassType

        queryBlock?(onSuccess as? ((QueryClassType.Data) -> Void) ?? { _ in }, onFailure)
    }
}

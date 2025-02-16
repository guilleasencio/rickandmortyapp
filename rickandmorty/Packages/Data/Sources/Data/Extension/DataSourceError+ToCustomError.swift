//
//  DataSourceError+ToCustomError.swift
//
//
//  Created by Guillermo Asencio Sanchez on 10/9/24.
//

import Domain
import GraphQL
import Foundation

public extension DataSourceError {
    func toCustomError() -> CustomError {
        switch self {
        case .missingResult(let message):
            return CustomError(errorCode: .missingResult, errorMessage: message)
        case .clientError(let error):
            return CustomError(errorCode: .clientError, errorMessage: error.localizedDescription)
        case .parseError(message: let message):
            return CustomError(errorCode: .parseError, errorMessage: message)
        }
    }
}

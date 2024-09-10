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
            return CustomError(errorCode: .missingResult, errorMessage: self.localizedDescription)
        case .clientError(let error):
            return CustomError(errorCode: .clientError, errorMessage: self.localizedDescription)
        }
    }
}

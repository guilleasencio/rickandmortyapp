//
//  DataSourceError.swift
//
//
//  Created by Guillermo Asencio Sanchez on 10/9/24.
//

import Foundation

public enum DataSourceError: Error, Equatable {
    case parseError(message: String)
    case missingResult(message: String)
    case clientError(error: Error)
    
    public static func == (lhs: DataSourceError, rhs: DataSourceError) -> Bool {
        switch (lhs, rhs) {
        case (.parseError, .parseError):
            return true
        case (.missingResult, .missingResult):
            return true
        case (.clientError, .clientError):
            return true
        default:
            return false
        }
    }
}

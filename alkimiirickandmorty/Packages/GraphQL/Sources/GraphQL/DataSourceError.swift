//
//  DataSourceError.swift
//
//
//  Created by Guillermo Asencio Sanchez on 10/9/24.
//

import Foundation

public enum DataSourceError: Error {
    case parseError(message: String)
    case missingResult(message: String)
    case clientError(error: Error)
}

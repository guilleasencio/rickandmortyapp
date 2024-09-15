//
//  CustomError.swift
//  
//
//  Created by Guillermo Asencio Sanchez on 10/9/24.
//

import Foundation

public struct CustomError: Error, Equatable, LocalizedError {
    public let errorCode: ErrorCode
    public let errorMessage: String

    public init(errorCode: ErrorCode, errorMessage: String) {
        self.errorCode = errorCode
        self.errorMessage = errorMessage
    }
    
    public var errorDescription: String? {
        errorMessage
    }
}


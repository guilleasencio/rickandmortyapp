//
//  StatusDTO.swift
//  
//
//  Created by Guillermo Asencio Sanchez on 10/9/24.
//

import Foundation

public enum StatusDTO: String {
    case alive = "Alive"
    case dead = "Dead"
    case unknown
    
    static func getStatus(_ from: String?) -> StatusDTO {
        guard let from = from, let status = StatusDTO(rawValue: from) else {
            return .unknown
        }
        return status
    }
}

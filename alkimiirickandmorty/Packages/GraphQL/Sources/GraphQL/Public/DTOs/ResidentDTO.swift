//
//  ResidentDTO.swift
//  
//
//  Created by Guillermo Asencio Sanchez on 10/9/24.
//

import Foundation

public struct ResidentDTO {
    public let id: String
    public let name: String
    
    public init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}

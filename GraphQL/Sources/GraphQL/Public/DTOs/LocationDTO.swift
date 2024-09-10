//
//  LocationDTO.swift
//  
//
//  Created by Guillermo Asencio Sanchez on 10/9/24.
//

import Foundation

public struct LocationDTO {
    public let id: String
    public let name: String?
    public let type: String?
    public let dimension: String?
    public let residents: [ResidentDTO]
    public let created: String?
    
    public init(
        id: String,
        name: String?,
        type: String?,
        dimension: String?,
        residents: [ResidentDTO],
        created: String?
    ) {
        self.id = id
        self.name = name
        self.type = type
        self.dimension = dimension
        self.residents = residents
        self.created = created
    }
}

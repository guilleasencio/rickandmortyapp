//
//  Location.swift
//  
//
//  Created by Guillermo Asencio Sanchez on 10/9/24.
//

import Foundation

public struct Location {
    public struct Resident {
        public let id: Int
        public let name: String
    }
    
    public let id: Int
    public let name: String
    public let type: String
    public let dimension: String
    public let residents: [Resident]
    public let created: Date
}

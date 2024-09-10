//
//  Episode.swift
//  
//
//  Created by Guillermo Asencio Sanchez on 10/9/24.
//

import Foundation

public struct Episode {
    public struct Character {
        public let id: Int
        public let name: String
    }
    
    public let id: Int
    public let name: String
    public let airDate: String
    public let characters: [Character]
    public let created: Date
}

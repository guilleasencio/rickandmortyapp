//
//  EpisodeDTO.swift
//  
//
//  Created by Guillermo Asencio Sanchez on 10/9/24.
//

import Foundation

public struct EpisodeDTO {
    public struct Character {
        public let id: String
        public let name: String
        
        public init(id: String, name: String) {
            self.id = id
            self.name = name
        }
    }
    
    public let id: String
    public let name: String
    public let airDate: String?
    public let characters: [EpisodeDTO.Character]
    public let created: String?
    
    public init(
        id: String,
        name: String,
        airDate: String?,
        characters: [EpisodeDTO.Character],
        created: String?
    ) {
        self.id = id
        self.name = name
        self.airDate = airDate
        self.characters = characters
        self.created = created
    }
}

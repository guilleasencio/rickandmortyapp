//
//  CharacterDTO.swift
//
//
//  Created by Guillermo Asencio Sanchez on 10/9/24.
//

import Foundation

public struct CharacterDTO {
    public let id: String
    public let name: String
    public let status: StatusDTO
    public let species: String?
    public let type: String?
    public let gender: GenderDTO
    public let origin: LocationDTO?
    public let location: LocationDTO?
    public let image: String
    public let episode: [EpisodeDTO]
    public let created: String?
    
    public init(
        id: String,
        name: String,
        status: StatusDTO,
        species: String?,
        type: String?,
        gender: GenderDTO,
        origin: LocationDTO?,
        location: LocationDTO?,
        image: String,
        episode: [EpisodeDTO],
        created: String?
    ) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.origin = origin
        self.location = location
        self.image = image
        self.episode = episode
        self.created = created
    }
}

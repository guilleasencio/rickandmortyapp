//
//  CharactersConverter.swift
//
//
//  Created by Guillermo Asencio Sanchez on 10/9/24.
//

import Domain
import GraphQL
import Foundation

protocol CharacterConverter: AutoMockable {
    func toDomain(_ data: CharacterDTO) -> Character
}

class CharacterConverterImplementation: CharacterConverter {
    func toDomain(_ dto: CharacterDTO) -> Character {
        Character(
            id: dto.id,
            name: dto.name,
            status: Character.getStatus(dto.status.rawValue),
            species: dto.species,
            type: dto.type,
            gender: Character.getGender(dto.gender.rawValue),
            origin: getLocation(dto.origin),
            location: getLocation(dto.location),
            image: dto.image,
            episode: dto.episode.compactMap({ getEpisode($0) }),
            created: dto.created
        )
    }
    
    private func getLocation(_ dto: LocationDTO?) -> Location? {
        guard let dto else {
            return nil
        }
        
        return Location(
            id: dto.id,
            name: dto.name,
            type: dto.name,
            dimension: dto.dimension,
            residents: dto.residents.compactMap({ getResident($0) }),
            created: dto.created
        )
    }
    
    private func getResident(_ dto: ResidentDTO?) -> Location.Resident? {
        guard let dto else {
            return nil
        }
        
        return Location.Resident(id: dto.id, name: dto.name)
    }
    
    private func getEpisode(_ dto: EpisodeDTO?) -> Episode? {
        guard let dto else {
            return nil
        }
        
        return Episode(
            id: dto.id,
            name: dto.name,
            airDate: dto.airDate,
            characters: dto.characters.compactMap({ getEpisodeCharacter($0) }),
            created: dto.created
        )
    }
    
    private func getEpisodeCharacter(_ dto: EpisodeDTO.Character?) -> Episode.Character? {
        guard let dto else {
            return nil
        }
        
        return Episode.Character(id: dto.id, name: dto.name)
    }
}

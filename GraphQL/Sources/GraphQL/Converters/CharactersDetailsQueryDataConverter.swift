//
//  CharactersDetailsQueryDataConverter.swift
//  
//
//  Created by Guillermo Asencio Sanchez on 14/9/24.
//

import Foundation

protocol CharactersDetailsQueryDataConverter {
    func toDto(_ data: API.GetCharacterDetailsQuery.Data) -> CharacterDTO?
}

private typealias APIOrigin = API.GetCharacterDetailsQuery.Data.Character.Origin
private typealias APILocation = API.GetCharacterDetailsQuery.Data.Character.Location
private typealias APIEpisode = API.GetCharacterDetailsQuery.Data.Character.Episode

class CharactersDetailsQueryDataConverterImplementation: CharactersDetailsQueryDataConverter {
    
    func toDto(_ data: GraphQL.API.GetCharacterDetailsQuery.Data) -> CharacterDTO? {
        guard let character = data.character else {
            return nil
        }

        return getCharacter(character)
    }
    
    private func getCharacter(_ from: API.GetCharacterDetailsQuery.Data.Character) -> CharacterDTO? {
        guard let id = from.id, let name = from.name else {
            return nil
        }
        
        return CharacterDTO(
            id: id,
            name: name,
            status: StatusDTO.getStatus(from.status),
            species: from.species,
            type: from.type,
            gender: GenderDTO.getGender(from.gender),
            origin: getOrigin(from.origin),
            location: getLocation(from.location),
            image: from.image ?? "",
            episode: from.episode.compactMap({ getEpisode($0) }),
            created: from.created
        )
    }
    
    private func getOrigin(_ from: APIOrigin?) -> LocationDTO? {
        guard let origin = from,
              let id = origin.id,
              let name = origin.name else {
            return nil
        }
        
        return LocationDTO(
            id: id,
            name: name,
            type: origin.type,
            dimension: origin.dimension,
            residents: origin.residents.compactMap({ getResident($0) }),
            created: origin.created
        )
    }
    
    private func getLocation(_ from: APILocation?) -> LocationDTO? {
        guard let origin = from,
              let id = origin.id,
              let name = origin.name else {
            return nil
        }
        
        return LocationDTO(
            id: id,
            name: name,
            type: origin.type,
            dimension: origin.dimension,
            residents: origin.residents.compactMap({ getResident($0) }),
            created: origin.created
        )
    }
    
    private func getResident(_ from: APIOrigin.Resident?) -> ResidentDTO? {
        guard let resident = from,
              let id = resident.id,
              let name = resident.name else {
            return nil
        }
        
        return ResidentDTO(id: id, name: name)
    }
    
    private func getResident(_ from: APILocation.Resident?) -> ResidentDTO? {
        guard let resident = from,
              let id = resident.id,
              let name = resident.name else {
            return nil
        }
        
        return ResidentDTO(id: id, name: name)
    }
    
    private func getEpisode(_ from: APIEpisode?) -> EpisodeDTO? {
        guard let episode = from,
              let id = episode.id,
              let name = episode.name else {
            return nil
        }
        
        return EpisodeDTO(
            id: id,
            name: name,
            airDate: episode.air_date,
            characters: episode.characters.compactMap({ getEpisodeCharacter($0) }),
            created: episode.created
        )
    }
    
    private func getEpisodeCharacter(_ from: APIEpisode.Character?) -> EpisodeDTO.Character? {
        guard let character = from,
              let id = character.id,
              let name = character.name else {
            return nil
        }
        
        return EpisodeDTO.Character(id: id, name: name)
    }
}

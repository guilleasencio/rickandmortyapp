//
//  CharactersQueryDataConverter.swift
//
//
//  Created by Guillermo Asencio Sanchez on 10/9/24.
//

import Foundation

protocol CharactersQueryDataConverter {
    func toDto(_ data: API.GetCharactersQuery.Data) -> [CharacterDTO]
}

typealias APIOrigin = API.GetCharactersQuery.Data.Characters.Result.Origin
typealias APILocation = API.GetCharactersQuery.Data.Characters.Result.Location
typealias APIEpisode = API.GetCharactersQuery.Data.Characters.Result.Episode

class CharactersQueryDataConverterImplementation: CharactersQueryDataConverter {
    func toDto(_ data: GraphQL.API.GetCharactersQuery.Data) -> [CharacterDTO] {
        guard let characters = data.characters?.results else {
            return []
        }

        return characters.compactMap{ result in
            guard let result = result else {
                return nil
            }
            return getCharacter(result)
        }
    }
    
    private func getCharacter(_ from: API.GetCharactersQuery.Data.Characters.Result) -> CharacterDTO? {
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
            image: from.image,
            episode: from.episode.compactMap({ getEpisode($0) }),
            created: from.created
        )
        
    }
    
    private func getOrigin(_ from: APIOrigin?) -> LocationDTO? {
        guard let origin = from,
              let id = origin.id else {
            return nil
        }
        
        return LocationDTO(
            id: id,
            name: origin.name,
            type: origin.type,
            dimension: origin.dimension,
            residents: origin.residents.compactMap({ getResident($0) }),
            created: origin.created
        )
    }
    
    private func getLocation(_ from: API.GetCharactersQuery.Data.Characters.Result.Location?) -> LocationDTO? {
        guard let origin = from,
              let id = origin.id else {
            return nil
        }
        
        return LocationDTO(
            id: id,
            name: origin.name,
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

//
//  CharactersConverter.swift
//
//
//  Created by Guillermo Asencio Sanchez on 10/9/24.
//

import Domain
import GraphQL
import Foundation

protocol GetCharactersQueryDataConverter {
    func toDomain(_ data: API.GetCharactersQuery.Data) -> [Character]
}

typealias APIOrigin = API.GetCharactersQuery.Data.Characters.Result.Origin
typealias APILocation = API.GetCharactersQuery.Data.Characters.Result.Location
typealias APIEpisode = API.GetCharactersQuery.Data.Characters.Result.Episode

class GetCharactersQueryDataConverterImplementation: GetCharactersQueryDataConverter {
    func toDomain(_ data: GraphQL.API.GetCharactersQuery.Data) -> [Character] {
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
    
    private func getCharacter(_ from: API.GetCharactersQuery.Data.Characters.Result) -> Character? {
        guard let id = from.id, let name = from.name else {
            return nil
        }
        
        return Character(
            id: id,
            name: name,
            status: Character.getStatus(from.status),
            species: from.species,
            type: from.type,
            gender: Character.getGender(from.gender),
            origin: getOrigin(from.origin),
            location: getLocation(from.location),
            image: from.image,
            episode: from.episode?.compactMap({ getEpisode($0) }) ?? [],
            created: from.created
        )
        
    }
    
    private func getOrigin(_ from: APIOrigin?) -> Location? {
        guard let origin = from,
              let id = origin.id else {
            return nil
        }
        
        return Location(
            id: id,
            name: origin.name,
            type: origin.type,
            dimension: origin.dimension,
            residents: origin.residents?.compactMap({ getResident($0) }) ?? [],
            created: origin.created
        )
    }
    
    private func getLocation(_ from: API.GetCharactersQuery.Data.Characters.Result.Location?) -> Location? {
        guard let origin = from,
              let id = origin.id else {
            return nil
        }
        
        return Location(
            id: id,
            name: origin.name,
            type: origin.type,
            dimension: origin.dimension,
            residents: origin.residents?.compactMap({ getResident($0) }) ?? [],
            created: origin.created
        )
    }
    
    private func getResident(_ from: APIOrigin.Resident?) -> Location.Resident? {
        guard let resident = from,
              let id = resident.id,
              let name = resident.name else {
            return nil
        }
        
        return Location.Resident(id: id, name: name)
    }
    
    private func getResident(_ from: APILocation.Resident?) -> Location.Resident? {
        guard let resident = from,
              let id = resident.id,
              let name = resident.name else {
            return nil
        }
        
        return Location.Resident(id: id, name: name)
    }
    
    private func getEpisode(_ from: APIEpisode?) -> Episode? {
        guard let episode = from,
              let id = episode.id,
              let name = episode.name else {
            return nil
        }
        
        return Episode(
            id: id,
            name: name,
            airDate: episode.air_date,
            characters: episode.characters?.compactMap({ getEpisodeCharacter($0) }) ?? [],
            created: episode.created
        )
    }
    
    private func getEpisodeCharacter(_ from: APIEpisode.Character?) -> Episode.Character? {
        guard let character = from,
              let id = character.id,
              let name = character.name else {
            return nil
        }
        
        return Episode.Character(id: id, name: name)
    }
}

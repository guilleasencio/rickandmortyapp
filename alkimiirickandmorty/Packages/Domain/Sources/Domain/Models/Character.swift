//
//  Character.swift
//
//
//  Created by Guillermo Asencio Sanchez on 10/9/24.
//

import Foundation

public struct Character {
    public enum Status: String {
        case alive = "Alive"
        case dead = "Dead"
        case unknown
    }
    
    public static func getStatus(_ from: String?) -> Status {
        guard let from = from, let status = Status(rawValue: from) else {
            return .unknown
        }
        return status
    }

    public enum Gender: String, Equatable, CaseIterable, Identifiable {
        case female = "Female"
        case male = "Male"
        case genderless = "Genderless"
        case unknown
        case all
        public var id: Gender { self }
    }
    
    public static func getGender(_ from: String?) -> Gender {
        guard let from = from, let gender = Gender(rawValue: from) else {
            return .unknown
        }
        return gender
    }
    
    public let id: String
    public let name: String
    public let status: Status?
    public let species: String?
    public let type: String?
    public let gender: Gender
    public let origin: Location?
    public let location: Location?
    public let image: String
    public let episode: [Episode]
    public let created: String?
    
    public init(
        id: String,
        name: String,
        status: Status?,
        species: String?,
        type: String?,
        gender: Gender,
        origin: Location?,
        location: Location?,
        image: String,
        episode: [Episode],
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

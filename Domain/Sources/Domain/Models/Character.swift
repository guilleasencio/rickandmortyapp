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

    public enum Gender: String {
        case female = "Female"
        case male = "Male"
        case genderless = "Genderless"
        case unknown
    }
    
    public let id: Int
    public let name: String
    public let status: Status
    public let species: String
    public let type: String
    public let gender: Gender
    public let origin: Location
    public let location: Location
    public let image: String
    public let episode: [Episode]
    public let created: Date
}

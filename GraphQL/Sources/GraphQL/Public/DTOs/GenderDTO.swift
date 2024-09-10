//
//  GenderDTO.swift
//
//
//  Created by Guillermo Asencio Sanchez on 10/9/24.
//

import Foundation

public enum GenderDTO: String {
    case female = "Female"
    case male = "Male"
    case genderless = "Genderless"
    case unknown
    
    static func getGender(_ from: String?) -> GenderDTO {
        guard let from = from, let gender = GenderDTO(rawValue: from) else {
            return .unknown
        }
        return gender
    }
}

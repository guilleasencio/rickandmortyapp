//
//  CharacterDetailsRepository.swift
//
//
//  Created by Guillermo Asencio Sanchez on 14/9/24.
//

import Foundation

public protocol CharacterDetailsRepository {
    func getCharacterDetails(for id: String) async throws -> Character
}

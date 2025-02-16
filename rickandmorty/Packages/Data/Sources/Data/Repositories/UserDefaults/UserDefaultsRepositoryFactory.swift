//
//  UserDefaultsRepositoryFactory.swift
//
//
//  Created by Guillermo Asencio Sanchez on 13/9/24.
//

import Domain
import Foundation

public enum UserDefaultsRepositoryFactory {
    public static func make(userDefaults: UserDefaults) -> UserDefaultsRepository {
        return UserDefaultsRepositoryImplementation(userDefaults: userDefaults)
    }
}

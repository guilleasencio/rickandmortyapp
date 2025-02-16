//
//  UserDefaultsRepository.swift
//
//
//  Created by Guillermo Asencio Sanchez on 13/9/24.
//

import Domain
import Foundation

class UserDefaultsRepositoryImplementation: UserDefaultsRepository {
    private let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults = UserDefaults.standard) {
        self.userDefaults = userDefaults
    }
    
    func getValue<T>(key: UserDefaultsKey) -> T? {
        userDefaults.object(forKey: key.rawValue) as? T
    }
    
    func setValue<T>(value: T, key: UserDefaultsKey) {
        userDefaults.set(value, forKey: key.rawValue)
    }
}

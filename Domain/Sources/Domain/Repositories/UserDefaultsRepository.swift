//
//  UserDefaultsRepository.swift
//
//
//  Created by Guillermo Asencio Sanchez on 13/9/24.
//

import Foundation
 
public protocol UserDefaultsRepository {
    func getValue<T>( key: UserDefaultsKey) -> T?
    func setValue<T>(value: T, key: UserDefaultsKey)
}

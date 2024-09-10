//
//  BackendConfig.swift
//  alkimiirickandmorty
//
//  Created by Guillermo Asencio Sanchez on 10/9/24.
//

import Foundation

enum BackendConfig {
    static var baseUrl: URL {
        guard let url = URL(string: "https://rickandmortyapi.com/graphql") else {
            fatalError("Unable to retrieve base URL")
        }
        
        return url
    }
}

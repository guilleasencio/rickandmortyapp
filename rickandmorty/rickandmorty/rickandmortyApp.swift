//
//  rickandmortyApp.swift
//  rickandmorty
//
//  Created by Guillermo Asencio Sanchez on 9/9/24.
//

import Data
import Domain
import SwiftUI

@main
struct rickandmortyApp: App {    
    var body: some Scene {
        WindowGroup {
            CharactersListViewFactory.make()
        }
    }
}

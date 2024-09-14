//
//  alkimiirickandmortyApp.swift
//  alkimiirickandmorty
//
//  Created by Guillermo Asencio Sanchez on 9/9/24.
//

import Data
import Domain
import SwiftUI

@main
struct alkimiirickandmortyApp: App {    
    var body: some Scene {
        WindowGroup {
            CharactersListViewFactory.make()
        }
    }
}

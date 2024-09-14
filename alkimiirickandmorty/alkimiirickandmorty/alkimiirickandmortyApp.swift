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
    @ObservedObject var appViewModel: AppViewModel = AppViewModelFactory.make()
    
    var body: some Scene {
        WindowGroup {
            CharactersListViewFactory.make()
            // Deeplinking Handling
            .onOpenURL { incomingURL in
                Task { @MainActor in
                    await handleDeeplink(incomingURL)
                }
            }
            .sheet(isPresented: $appViewModel.hasToPresentDeeplink) {
                if let character = appViewModel.character {
                    CharacterDetailsViewFactory.make(
                        character: character,
                        isFavourite: appViewModel.favouriteCharacters.contains(character.id)
                    )
                }
            }
            .alert(isPresented: $appViewModel.showError, error: appViewModel.error) { _ in
                Button("OK") {
                    appViewModel.showError = false
                    appViewModel.error = nil
                }
            } message: { error in
                Text(error.errorMessage)
            }
        }
    }
    
    @MainActor
    private func handleDeeplink(_ url: URL) async {
        guard url.scheme == "alkimiirickandmorty" else {
            return
        }
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            print("Invalid URL")
            return
        }
        
        guard let action = components.host, action == "character" else {
            print("Unknown URL, we can't handle this one!")
            return
        }
        
        let pathElements = components.path.components(separatedBy: "/").filter({ !$0.isEmpty })
        
        guard pathElements.count == 1 else {
            print("Invalid path format")
            return
        }
        
        await appViewModel.getCharacterDetails(by: pathElements[0])
    }
}

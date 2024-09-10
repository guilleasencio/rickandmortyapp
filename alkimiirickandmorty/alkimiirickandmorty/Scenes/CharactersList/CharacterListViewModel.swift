//
//  CharacterListViewModel.swift
//  alkimiirickandmorty
//
//  Created by Guillermo Asencio Sanchez on 10/9/24.
//

import Domain
import Foundation

class CharacterListViewModel: ObservableObject {
    @Published var characters: [Character] = []
    
    private let getCharactersUseCase: GetCharactersUseCase
    
    init(getCharactersUseCase: GetCharactersUseCase) {
        self.getCharactersUseCase = getCharactersUseCase
    }
    
    @MainActor
    func onAppear() async {
        do {
            characters = try await getCharactersUseCase(page: 0, gender: nil)
        } catch {
            // Empty
        }
    }
}

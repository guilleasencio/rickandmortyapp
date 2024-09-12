//
//  CharactersListItemView.swift
//  alkimiirickandmorty
//
//  Created by Guillermo Asencio Sanchez on 12/9/24.
//

import Domain
import SwiftUI

struct CharactersListItemView: View {
    @State private var character: Character
    
    init(character: Character) {
        self.character = character
    }
    
    var body: some View {
        HStack(alignment: .center) {
            CharacterImageView(url: character.image)
                .frame(width: 80.0, height: 80.0, alignment: .center)
                .clipShape(.rect(cornerRadius: 12))
                .padding(.all, 20)
            
            VStack(alignment: .leading, spacing: 8.0) {
                Text(character.name)
                    .font(.system(size: 20.0))
                    .bold()
               
                Text(character.origin?.name ?? "unknown origin")
                        .font(.system(size: 12.0))
                        .lineLimit(1)
                        .truncationMode(.tail)
                
                Text("Gender: \(character.gender.rawValue)")
                    .font(.system(size: 12.0))
            }
            Spacer()
        }
        .padding(.vertical, 10)
    }
}

#Preview {
    let character = Character(
        id: "1",
        name: "Rick Sanchez",
        status: .alive,
        species: "Human",
        type: nil,
        gender: .male,
        origin: Location(
            id: "1",
            name: "Earth (C-137)",
            type: "Planet",
            dimension: "Dimension C-137",
            residents: [Location.Resident(
                id: "38",
                name: "Beth Smith"
            ),
                        Location.Resident(
                            id: "45",
                            name: "Bill"
                        )
            ],
            created: "2017-11-10T12:42:04.162Z"
        ),
        location: Location(
            id: "3",
            name: "Citadel of Ricks",
            type: "Space station",
            dimension: "unknown",
            residents: [Location.Resident(
                id: "1",
                name: "Rick Sanchez"
            ),
                        Location.Resident(
                            id: "2",
                            name: "Morty Smith"
                        )
            ],
            created: "2017-11-10T13:08:13.191Z"
        ),
        image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
        episode: [
            Episode(
                id: "1",
                name: "Pilot",
                airDate:  "December 2, 2013",
                characters: [
                    Episode.Character(
                        id: "1",
                        name: "Rick Sanchez"
                    ),
                    Episode.Character(
                        id: "2",
                        name: "Morty Smith"
                    )
                ],
                created: "2017-11-10T12:56:33.798Z"
            )],
        created: "2017-11-04T18:48:46.250Z"
    )
    
    return CharactersListItemView(character: character)
        .frame(width: 375, height: 120)
}

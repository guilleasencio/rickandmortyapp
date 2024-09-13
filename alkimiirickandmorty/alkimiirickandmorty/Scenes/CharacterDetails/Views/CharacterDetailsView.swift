//
//  CharacterDetailsView.swift
//  alkimiirickandmorty
//
//  Created by Guillermo Asencio Sanchez on 12/9/24.
//

import Domain
import SwiftUI

struct CharacterDetailsView: View {
    @ObservedObject var viewModel: CharacterDetailsViewModel
    
    init(viewModel: CharacterDetailsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 18) {
                    headerView()
                    infoView()
                }
            }
        }
    }
    
    @ViewBuilder
    private func headerView() -> some View {
        VStack(alignment: .center, spacing: 8) {
            Text(viewModel.character.name)
                .font(.title)
                .bold()
            CharacterImageView(url: viewModel.character.image)
                .frame(width: 280.0, height: 280.0, alignment: .center)
                .clipShape(.rect(cornerRadius: 12))
                .padding(.all, 12)
        }
    }
    
    @ViewBuilder
    private func infoView() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Gender: \(viewModel.character.gender.rawValue)")
            Text("Status: \(viewModel.character.status?.rawValue ?? "unknown")")
            Text("Species: \(viewModel.character.species ?? "unknown")")
            Text("Type: \(viewModel.character.type ?? "unknown")")
            Text("Origin: \(viewModel.character.origin?.name ?? "unknown")")
            Text("Location: \(viewModel.character.location?.name ?? "unknown")")
        }
        .font(.system(size: 18.0))
        .lineLimit(1)
        .truncationMode(.tail)
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
    let viewModel = CharacterDetailsViewModel(character: character)
    return CharacterDetailsView(viewModel: viewModel)
}

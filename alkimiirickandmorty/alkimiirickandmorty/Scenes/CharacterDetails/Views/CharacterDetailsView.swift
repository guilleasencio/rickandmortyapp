//
//  CharacterDetailsView.swift
//  alkimiirickandmorty
//
//  Created by Guillermo Asencio Sanchez on 12/9/24.
//

import Data
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
                .padding(.horizontal, 20)
            }
        }
    }
    
    @ViewBuilder
    private func headerView() -> some View {
        VStack(alignment: .center, spacing: 8) {
            ZStack {
                Text(viewModel.character.name)
                    .multilineTextAlignment(.center)
                    .font(.title)
                    .bold()
                    .padding(.horizontal, 40)

                HStack {
                    Spacer()
                    favouriteButton()
                        .padding(.trailing, 0)
                }
            }
            CharacterImageView(url: viewModel.character.image)
                .frame(width: 250.0, height: 250.0, alignment: .center)
                .clipShape(Circle())
                .overlay {
                    Circle()
                        .stroke(.black, lineWidth: 4)
                }
                .shadow(radius: 10)
                .padding(.all, 20)
        }
    }
    
    @ViewBuilder
    private func favouriteButton() -> some View {
        Button {
            viewModel.updateFavourite()
        } label: {
            Label("Toggle Favorite", systemImage: viewModel.isFavourite ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .font(.system(size: 32))
                .foregroundStyle(.black)
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
    
    let userDefaultsRepository = UserDefaultsRepositoryFactory.make(userDefaults: UserDefaults.standard)
    
    let updateFavouriteCharactersUseCase = UpdateFavouriteCharactersUseCaseFactory.make(userDefaultsRepository: userDefaultsRepository)
    
    let viewModel = CharacterDetailsViewModel(
        character: character,
        isFavourite: false,
        updateFavouriteCharactersUseCase: updateFavouriteCharactersUseCase
    )
    
    return CharacterDetailsView(viewModel: viewModel)
}

//
//  CharacterImageView.swift
//  rickandmorty
//
//  Created by Guillermo Asencio Sanchez on 12/9/24.
//

import SwiftUI

class CharacterImageModel: ObservableObject {
    @Published var url: String
    
    init(url: String) {
        self.url = url
    }
}

struct CharacterImageView: View {
    @ObservedObject private var image: CharacterImageModel
    
    init(image: CharacterImageModel) {
        self.image = image
    }
    
    var body: some View {
        AsyncImage(url: URL(string: image.url)) { phase in
            switch phase {
            case .empty, .failure:
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
            case .success(let image):
                image
                    .resizable()
            default:
                ProgressView()
            }
        }
    }
}

#Preview {
    CharacterImageView(image: CharacterImageModel(url:  "https://rickandmortyapi.com/api/character/avatar/1.jpeg"))
        .frame(width: 256, height: 256)
        .clipShape(.rect(cornerRadius: 25))
}

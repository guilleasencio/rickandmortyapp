//
//  CharacterImageView.swift
//  alkimiirickandmorty
//
//  Created by Guillermo Asencio Sanchez on 12/9/24.
//

import SwiftUI

struct CharacterImageView: View {
    @State private var url: String
    
    init(url: String) {
        self.url = url
    }
    
    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
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
    CharacterImageView(url: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")
        .frame(width: 256, height: 256)
        .clipShape(.rect(cornerRadius: 25))
}

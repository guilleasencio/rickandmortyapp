//
//  FavoriteButtonView.swift
//  alkimiirickandmorty
//
//  Created by Guillermo Asencio Sanchez on 13/9/24.
//

import SwiftUI

struct FavoriteButtonView: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundStyle(isSet ? .black : .gray)
        }
    }
}


#Preview {
    FavoriteButtonView(isSet: .constant(true))
}

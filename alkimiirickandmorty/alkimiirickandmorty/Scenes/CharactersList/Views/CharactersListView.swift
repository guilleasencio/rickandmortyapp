//
//  CharactersListView.swift
//  alkimiirickandmorty
//
//  Created by Guillermo Asencio Sanchez on 10/9/24.
//

import Data
import Domain
import SwiftUI

struct CharactersListView: View {
    @ObservedObject var viewModel: CharacterListViewModel
    @State var gender: Character.Gender = .all
    
    init(viewModel: CharacterListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    genderFilter()
                    Spacer()
                }
                if viewModel.loadState == .pendingToInit {
                    ProgressView()
                } else {
                    List() {
                        Section {
                            ForEach(viewModel.characters, id: \.id) { character in
                                CharactersListItemView(character: character)
                                    .listRowSeparator(.hidden)
                            }
                            .listRowInsets(EdgeInsets.init(.zero))
                            if viewModel.hasMoreData {
                                loadMoreRow()
                            }
                        } header: {
                        }
                    }
            }
            }
            .navigationTitle("Characters")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                Task { @MainActor in
                    await viewModel.loadData()
                }
            }
        }
    }
    
    @ViewBuilder
    private func genderFilter() -> some View {
        HStack {
            Text("Filter by Gender:")
                .font(.system(size: 18.0))
                .foregroundColor(.black)
            Picker("Gender", selection: $gender) {
                ForEach(Character.Gender.allCases) { gender in
                    Text(gender.rawValue)
                        .tag(gender)
                }
            }
            .onChange(of: gender) { oldValue, newValue in
                viewModel.setGender(newGender: newValue)
            }
            .pickerStyle(.menu)
            .tint(.black)
        }
        .textCase(.none)
    }
    
    @ViewBuilder
    private func loadMoreRow() -> some View {
        ZStack(alignment: .center) {
            switch viewModel.loadState {
            case .pendingToInit, .isLoading:
                    HStack(alignment: .center) {
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                case .idle:
                    EmptyView()
                }
            }
            .frame(height: 50)
            .onAppear {
                Task { @MainActor in
                    await viewModel.loadData()
                }
            }
    }
}

#Preview {
    let charactersRepository = CharactersRepositoryFactory.make()
    let getCharactersUseCase = GetCharactersUseCaseFactory.make(charactersRepository: charactersRepository)
    let viewModel = CharacterListViewModel(getCharactersUseCase: getCharactersUseCase)
    return CharactersListView(viewModel: viewModel)
}

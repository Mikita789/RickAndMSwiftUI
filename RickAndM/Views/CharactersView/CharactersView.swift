//
//  ContentView.swift
//  RickAndM
//
//  Created by Никита Попов on 2.11.23.
//

import SwiftUI

struct CharactersView: View {
    @State private var searchText = ""
    @ObservedObject var model = CharactersViewModel()
    @State private var isShowDetails = false
    @State private var currentItem:CharacterModel?
    
    
    var body: some View {
        NavigationStack {
            VStack {
                List{
                    ForEach(model.chrArr, id: \.id){item in
                        NewCell(item: item)
                            .onTapGesture {
                                currentItem = item
                                isShowDetails.toggle()
                            }
                    }
                    .frame(maxWidth: .infinity)
                }
                .sheet(item: $currentItem) { item in
                    DetailsView(item: item)
                }
                
                Spacer()
            }
            .searchable(text: $searchText)
            .onChange(of: searchText, perform: { value in
                Task{
                    try await model.searchCharacters(name: searchText)
                }
            })
            .padding()
            .listStyle(.plain)
            .navigationTitle("Rick And Morty")
            .toolbar {
                HStack {
                    NavigationLink(destination: FavoriteView()) {
                        Image(systemName: "play" )
                    }
                    Button(action: {
                        Task{
                            try await model.firstLoadCharacters()
                        }
                    }, label: {
                        Image(systemName: "gobackward")
                            .foregroundStyle(.black)
                    })
                }
            }
        }
        
    }
}

#Preview {
    CharactersView()
}

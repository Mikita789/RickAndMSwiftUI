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
    
    
    var body: some View {
        NavigationStack {
            VStack {
                List{
                    ForEach(model.chrArr, id: \.id){item in
                        NavigationLink {
                            DetailsView(item: item)
                        } label: {
                            //TableCellPrototype(item: item)
                            NewCell(item: item)
                        }
                    }
                    .frame(maxWidth: .infinity)

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

#Preview {
    CharactersView()
}

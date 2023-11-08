//
//  DetailsView.swift
//  RickAndM
//
//  Created by Никита Попов on 3.11.23.
//

import SwiftUI

struct DetailsView: View {
    var item: CharacterModel
    let model = DetailsViewModel()
    
    var body: some View {
        VStack {
            ZStack(alignment : .bottom){
                AsyncImage(url: URL(string: item.image)){image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .clipShape(Circle())
                    .frame(width: 300, height: 300)
                    .shadow(color: model.statusLife(item.status), radius: 30)
                
                Text(item.name)
                    .font(.title)
                    .foregroundStyle(.black)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 10)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            Spacer()
            
        }
    }
}

#Preview {
    DetailsView(item: CharacterModel(item: Result(id: 100, name: "rick", status: "Alive", species: "asdasd", type: "human", gender: "male", origin: Location(name: "asdads", url: "asdasd"), location: Location(name: "asdasd", url: "asdasd"), image: "https://rickandmortyapi.com/api/character/avatar/38.jpeg", episode: ["asdasd"], url: "asdasd", created: "asdasd")))
}



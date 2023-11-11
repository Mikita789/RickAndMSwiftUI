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
    @State private var isFavorite = false
    @Environment(\.managedObjectContext) var context
    
    
    var body: some View {
        GeometryReader { sc in
            VStack {
                ZStack(alignment : .bottomTrailing){
                    AsyncImage(url: URL(string: item.image)){image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .clipShape(Circle())
                        .frame(width: 300, height: 300)
                        .shadow(color: model.statusLife(item.status), radius: 30)
                    
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .resizable()
                        .frame(width: 35, height: 30)
                        .foregroundStyle(isFavorite ? .red : .secondary)
                        .onTapGesture {
                            isFavorite.toggle()
                            DataManager().addItemChar(chr: item, context: context)
                        }
                    
                }
                
                VStack(alignment: .leading){
                    HStack {
                        Spacer()
                        Text("Name : \(item.name)")
                            .font(.custom("matrix", size: 50))
                        .padding()
                        Spacer()
                    }
                    Spacer()
                    Text("Status : \(item.status)")
                        .font(.custom("matrix", size: 40))
                        .padding()
                    Text("TYPE : \(item.species)")
                        .font(.custom("matrix", size: 40))
                        .padding()
                    Text("gender : \(item.gender)")
                        .font(.custom("matrix", size: 40))
                        .padding()
                    Text("planet : \(item.location.name)")
                        .font(.custom("matrix", size: 40))
                        .padding()
                    Spacer()
                }
                .frame(width: sc.size.width, height: sc.size.height / 1.5)
                .background(Color("backGrColor"))
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .alignmentGuide(.leading, computeValue: { _ in 0 })
                .foregroundStyle(Color("matrixColor"))
                
            }
        }
    }
}

#Preview {
    DetailsView(item: CharacterModel(item: Result(id: 100, name: "Rick", status: "Alive", species: "asdasd", type: "human", gender: "male", origin: Location(name: "asdads", url: "asdasd"), location: Location(name: "asdasd", url: "asdasd"), image: "https://rickandmortyapi.com/api/character/avatar/38.jpeg", episode: ["asdasd"], url: "asdasd", created: "asdasd")))
}



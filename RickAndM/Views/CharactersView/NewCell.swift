//
//  NewCell.swift
//  RickAndM
//
//  Created by Никита Попов on 8.11.23.
//

import SwiftUI

struct NewCell: View {
    let item: CharacterModel
    
    var body: some View {
        VStack(alignment : .leading){
            HStack(alignment: .top){
                AsyncImage(url: URL(string: item.image)){image in
                    image.resizable()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                }placeholder: {
                    ProgressView()
                }
                
                VStack(alignment: .leading){
                    HStack {
                        Text(item.name)
                            .font(.system(.title, weight: .bold))
                        statusLife()
                            .frame(width: 10, height: 10)
                            .clipShape(.circle)
                    }
                    Text("\(item.status) - \(item.species) \(item.type)")
                    //Text("Last Location - Sun")
                }
                Spacer()
            }
        }
        //.frame(maxWidth: .infinity)
        .background(Color("backGrColor"))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        //.padding(.horizontal)


    }
    
    private func statusLife()->Color{
        
        if item.status == "Alive"{
            return Color.green
        }else if item.status == "Dead"{
            return Color.red
        }else{
            return Color.yellow
        }
    }
}

//#Preview {
//    NewCell()
//}

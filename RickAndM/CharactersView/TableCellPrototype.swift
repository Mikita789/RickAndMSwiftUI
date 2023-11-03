//
//  TableCellPrototype.swift
//  RickAndM
//
//  Created by Никита Попов on 3.11.23.
//

import SwiftUI

struct TableCellPrototype: View {
    var item:CharacterModel
    
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: item.image)){image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
                .clipShape(Circle())
                .frame(width: 100, height: 100)
            
            Spacer()
            
            VStack(spacing: 10){
                Text(item.name)
                    .font(.title2)
                Text(item.status)
            }
            
            Spacer()
        }
    }
}

//#Preview {
//    TableCellPrototype()
//}

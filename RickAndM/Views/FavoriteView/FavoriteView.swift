//
//  FavoriteView.swift
//  RickAndM
//
//  Created by Никита Попов on 11.11.23.
//

import SwiftUI

struct FavoriteView: View {
    @Environment(\.managedObjectContext) private var context
    @FetchRequest(sortDescriptors: []) private var results: FetchedResults<CharacterDataModel>
    @State private var isShowDetails = false
    
    @State private var currentItem: CharacterDataModel?
    
    
    var body: some View {
        
        List{
            ForEach(results, id: \.id){item in
                NewCell(item: transfer(item: item))
                    .onTapGesture {
                        isShowDetails.toggle()
                        self.currentItem = item
                    }
            }
            .onDelete(perform: { indexSet in
                DataManager().deleteChr(context: context, item: results[indexSet.first!])
            })
        }
        .listStyle(.plain)
        .sheet(isPresented: $isShowDetails, content: {
            if let currentItem = self.currentItem{
                DetailsView(item: transfer(item: currentItem))
            }
        })
    }
    
    private func transfer(item: CharacterDataModel)->CharacterModel{
        let res = CharacterModel(dataItem: item)
        return res
    }
}

#Preview {
    FavoriteView()
}

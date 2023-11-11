//
//  AppDataModel.swift
//  RickAndM
//
//  Created by Никита Попов on 2.11.23.
//

import Foundation

struct CharactersArrayModel{
    let result: [CharacterModel]
}

struct CharacterModel:CharactersProtocol{
    var id: Int
    var name: String
    var status: String
    var species: String
    var type: String
    var gender: String
    var origin, location: LocationCh
    var image: String
    
    init(item: Result){
        self.id = item.id
        self.name = item.name
        self.status = item.status
        self.species = item.species
        self.type = item.type
        self.gender = item.gender
        self.origin = LocationCh(name: item.origin.name, url: item.origin.url)
        self.location = LocationCh(name: item.origin.name, url: item.origin.url)
        self.image = item.image
    }
    
    init(dataItem: CharacterDataModel){
        self.id = Int(dataItem.id)
        self.name = dataItem.name ?? "-"
        self.status = dataItem.status ?? "-"
        self.species = dataItem.species ?? "-"
        self.type = dataItem.type ?? "-"
        self.gender = dataItem.gender ?? "-"
        self.origin = LocationCh(name: "", url: "")
        self.location = LocationCh(name: "", url: "")
        self.image = dataItem.image ?? "-"
    }
    
}


struct LocationCh  {
    let name: String
    let url: String
}

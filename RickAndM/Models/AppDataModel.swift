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

struct CharacterModel{
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin, location: LocationCh
    let image: String
    
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
}


struct LocationCh  {
    let name: String
    let url: String
}

//
//  CharactersViewModel.swift
//  RickAndM
//
//  Created by Никита Попов on 3.11.23.
//

import Foundation


class CharactersViewModel: ObservableObject{
    @Published var chrArr:[CharacterModel] = []
    
    func firstLoadCharacters() async throws {
        self.chrArr = try await NetwManager.shared.fetchStartData(type: .charactrers)
    }
    func searchCharacters(name: String)async throws{
        self.chrArr = try await NetwManager.shared.fetchData(type: .charactrers, param: name)
    }
    
    init(){
        Task{
            try await firstLoadCharacters()
        }
    }
}
 

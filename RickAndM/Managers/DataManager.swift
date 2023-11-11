//
//  DataManager.swift
//  RickAndM
//
//  Created by Никита Попов on 11.11.23.
//

import Foundation
import CoreData


class DataManager:ObservableObject{
    
    let container:NSPersistentContainer
    
    init(){
        self.container = NSPersistentContainer(name: "RMDataModel")
        self.container.loadPersistentStores { descr, err in
            if let err = err {
                fatalError("не удалось загрузить память")
            }
        }
    }
    
    private func save(context: NSManagedObjectContext){
        do{
            try context.save()
        }catch{
            fatalError("не удалось сохраниться")
        }
    }
    
    func addItemChar(chr: CharacterModel, context: NSManagedObjectContext){
        let newFavoriteChr = CharacterDataModel(context: context)
        newFavoriteChr.id = Int16(chr.id)
        newFavoriteChr.name = chr.name
        newFavoriteChr.status = chr.status
        newFavoriteChr.species = chr.species
        newFavoriteChr.gender = chr.gender
        newFavoriteChr.type = chr.type
        newFavoriteChr.image = chr.image
        
        save(context: context)
    }
    
    func deleteChr(context: NSManagedObjectContext, item: CharacterDataModel){
        context.delete(item)
        save(context: context)
    }
    
}

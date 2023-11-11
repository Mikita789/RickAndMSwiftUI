//
//  DetailsViewModel.swift
//  RickAndM
//
//  Created by Никита Попов on 8.11.23.
//

import Foundation
import SwiftUI
import CoreData

class DetailsViewModel: ObservableObject{
    
    
    func statusLife(_ status: String)->Color{
        
        if status == "Alive"{
            return Color.green
        }else if status == "Dead"{
            return Color.red
        }else{
            return Color.yellow
        }
    }
    
    func saveFavoriteObj(item: CharacterModel){
        let application = UIApplication.shared.delegate as? UIApplicationDelegate
    }
}

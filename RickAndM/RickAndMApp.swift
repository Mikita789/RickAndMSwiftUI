//
//  RickAndMApp.swift
//  RickAndM
//
//  Created by Никита Попов on 2.11.23.
//

import SwiftUI

@main
struct RickAndMApp: App {
    @ObservedObject private var persistCont = DataManager()
    
    
    var body: some Scene {
        WindowGroup {
            CharactersView()
                .environment(\.managedObjectContext, persistCont.container.viewContext)
        }
    }
}

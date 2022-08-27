//
//  CoreDataPreviewsApp.swift
//  CoreDataPreviews
//
//  Created by Eyup Göymen on 25.08.2022.
//

import SwiftUI

@main
struct CoreDataPreviewsApp: App {
    var persistenceManager = PersistenceManager()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ShoppingListView()
                    .navigationTitle("Shopping list")
            }
            .environmentObject(persistenceManager)
        }
    }
}

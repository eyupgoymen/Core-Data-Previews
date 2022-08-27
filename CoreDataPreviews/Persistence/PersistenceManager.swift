//
//  PersistenceManager.swift
//  CoreDataPreviews
//
//  Created by Eyup Göymen on 26.08.2022.
//

import Foundation
import CoreData

final class PersistenceManager: ObservableObject {
    static let shared = PersistenceManager()
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "CoreDataPreviews")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
    
    func saveList(with name: String) {
        let list = ShoppingList(context: container.viewContext)
        list.name = name
        
        // Skip error handling for the sake of simplicity.
        try? container.viewContext.save()
    }
    
    func retrieveList() -> [ShoppingList] {
        let fetchRequest: NSFetchRequest<ShoppingList> = ShoppingList.fetchRequest()
        
        do {
            return try container.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
    func saveItem(name: String, amount: Int, for list: ShoppingList) {
        let item = ShoppingListItem(context: container.viewContext)
        item.name = name
        item.amount = Int16(amount)
        
        list.addToItems(item)
        // Skip error handling for the sake of simplicity.
        try? container.viewContext.save()
    }
}

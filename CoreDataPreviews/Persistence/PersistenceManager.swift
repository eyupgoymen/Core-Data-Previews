//
//  PersistenceManager.swift
//  CoreDataPreviews
//
//  Created by Eyup Göymen on 26.08.2022.
//

import Foundation
import CoreData

final class PersistenceManager: ObservableObject {
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "CoreDataPreviews")
        
        // Use memory as a storage
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
    
    @discardableResult
    func saveList(with name: String) -> ShoppingList {
        let list = ShoppingList(context: container.viewContext)
        list.name = name
        
        // Skip error handling for the sake of simplicity.
        try? container.viewContext.save()
        return list
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

extension PersistenceManager {
    static var preview: PersistenceManager = {
        let manager = PersistenceManager(inMemory: true)
        let list1 = manager.saveList(with: "Preview list 1")
        let list2 = manager.saveList(with: "Preview list 2")
        
        manager.saveItem(name: "Preview item 1", amount: 1, for: list1)
        manager.saveItem(name: "Preview item 2", amount: 5, for: list1)
        manager.saveItem(name: "Preview item 3", amount: 2, for: list2)
        manager.saveItem(name: "Preview item 4", amount: 5, for: list2)
        return manager
    }()
}

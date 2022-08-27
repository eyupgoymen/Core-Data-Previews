//
//  ShoppingList+Mock.swift
//  CoreDataPreviews
//
//  Created by Eyup Göymen on 27.08.2022.
//

import CoreData

final class EntityMockDataProvider {
    static func mockData<T: NSManagedObject>(for type: T.Type) -> T {
        let context = PersistenceManager.preview.container.viewContext
        
        let fetchRequest: NSFetchRequest<T> = NSFetchRequest<T>(entityName: T.entity().name ?? "")
        fetchRequest.fetchLimit = 1
        
        let results = try? context.fetch(fetchRequest)
        
        return (results?.first!)!
    }
}

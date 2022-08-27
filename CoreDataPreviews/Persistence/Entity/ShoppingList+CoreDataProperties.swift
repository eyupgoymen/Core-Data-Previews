//
//  ShoppingList+CoreDataProperties.swift
//  CoreDataPreviews
//
//  Created by Eyup Göymen on 26.08.2022.
//
//

import Foundation
import CoreData


extension ShoppingList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ShoppingList> {
        return NSFetchRequest<ShoppingList>(entityName: "ShoppingList")
    }

    @NSManaged public var name: String
    @NSManaged public var items: Set<ShoppingListItem>

}

// MARK: Generated accessors for items
extension ShoppingList {

    @objc(addItemsObject:)
    @NSManaged public func addToItems(_ value: ShoppingListItem)

    @objc(removeItemsObject:)
    @NSManaged public func removeFromItems(_ value: ShoppingListItem)

    @objc(addItems:)
    @NSManaged public func addToItems(_ values: NSSet)

    @objc(removeItems:)
    @NSManaged public func removeFromItems(_ values: NSSet)

}

extension ShoppingList : Identifiable {

}

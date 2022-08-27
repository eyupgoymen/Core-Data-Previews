//
//  ShoppingListItem+CoreDataProperties.swift
//  CoreDataPreviews
//
//  Created by Eyup Göymen on 26.08.2022.
//
//

import Foundation
import CoreData


extension ShoppingListItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ShoppingListItem> {
        return NSFetchRequest<ShoppingListItem>(entityName: "ShoppingListItem")
    }

    @NSManaged public var name: String
    @NSManaged public var amount: Int16

}

extension ShoppingListItem : Identifiable {

}

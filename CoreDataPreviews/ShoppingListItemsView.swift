//
//  ShoppingListItemsView.swift
//  CoreDataPreviews
//
//  Created by Eyup Göymen on 26.08.2022.
//

import SwiftUI

struct ShoppingListItemsView: View {
    @EnvironmentObject var persistenceManager: PersistenceManager
    @ObservedObject var shoppingList: ShoppingList
    @State private var newItemName = ""
    @State private var newItemAmount = ""
    
    var body: some View {
        List {
            Section {
                TextField("Title", text: $newItemName)
                TextField("Amount", text: $newItemAmount)
                Button {
                    persistenceManager.saveItem(name: newItemName, amount: Int(newItemAmount) ?? 0, for: shoppingList)
                    newItemName = ""
                    newItemAmount = ""
                } label: {
                    Text("Save")
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                }
                .tint(.purple)
                .buttonStyle(.bordered)
                .disabled(newItemName.isEmpty)
            } header: {
                Text("Add new item")
            }
            
            Section {
                ForEach(Array(shoppingList.items)) { item in
                    ItemView(item: item)
                }
            }
        }
    }
}

struct ShoppingListItemsView_Previews: PreviewProvider {
    static var previews: some View {
        let shoppingList = ShoppingList(context: PersistenceManager.shared.container.viewContext)
        let item1 = ShoppingListItem(context: PersistenceManager.shared.container.viewContext)
        let item2 = ShoppingListItem(context: PersistenceManager.shared.container.viewContext)
        item1.name = "Item 1"
        item2.name = "Item 2"
        item1.amount = 1
        item2.amount = 2
        shoppingList.items = [item1, item2]
        
        
        return ShoppingListItemsView(shoppingList: shoppingList)
            .environmentObject(PersistenceManager.shared)
    }
}

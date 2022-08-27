//
//  ShoppingListView.swift
//  CoreDataPreviews
//
//  Created by Eyup Göymen on 26.08.2022.
//

import SwiftUI

struct ShoppingListView: View {
    @EnvironmentObject var persistenceManager: PersistenceManager
    @State private var newListName = ""
    @State private var lists: [ShoppingList] = []
    
    var body: some View {
        List {
            Section {
                TextField("Title", text: $newListName)
                Button {
                    persistenceManager.saveList(with: newListName)
                    newListName = ""
                    retriveLists()
                } label: {
                    Text("Save")
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                }
                .tint(.purple)
                .buttonStyle(.bordered)
                .disabled(newListName.isEmpty)
            } header: {
                Text("Add new list")
            }
            
            Section {
                ForEach(lists) { list in
                    NavigationLink {
                        ShoppingListItemsView(shoppingList: list)
                            .navigationBarTitle(list.name)
                    } label: {
                        Text(list.name)
                    }
                }
            } header: {
                Text("Lists")
            }
        }
        .onAppear {
            retriveLists()
        }
    }
    
    func retriveLists() {
        lists = persistenceManager.retrieveList()
    }
}

struct ShoppingListView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingListView()
            .environmentObject(PersistenceManager.shared)
    }
}

//
//  ItemView.swift
//  CoreDataPreviews
//
//  Created by Eyup Göymen on 27.08.2022.
//

import SwiftUI

struct ItemView: View {
    var item: ShoppingListItem
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(item.name)
                .font(.system(size: 18, weight: .medium, design: .rounded))
                .foregroundColor(.primary)
            Text("Amount: " + String(item.amount))
                .font(.system(size: 14, weight: .regular, design: .rounded))
                .foregroundColor(.secondary)
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        let item1 = ShoppingListItem(context: PersistenceManager.shared.container.viewContext)
        item1.name = "Item 1"
        item1.amount = 1
        
        return ItemView(item: item1)
    }
}

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
        let mockData = EntityMockDataProvider.mockData(for: ShoppingListItem.self)
        return ItemView(item: mockData)
    }
}

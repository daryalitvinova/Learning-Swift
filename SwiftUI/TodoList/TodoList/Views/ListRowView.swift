//
//  ListRowView.swift
//  TodoList
//
//  Created by Дарья Литвинова on 16.12.2025.
//

import SwiftUI

struct ListRowView: View {
    
    var item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title3)
        .contentShape(Rectangle())
        //.padding(.vertical, 8)
    }
}

//#Preview {
struct ListRowView_Previews: PreviewProvider {
    static var item1 = ItemModel(title: "Первая заметка", isCompleted: false)
    
    static var item2 = ItemModel(title: "Вторая заметка", isCompleted: true)
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}

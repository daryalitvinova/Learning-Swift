//
//  ListView.swift
//  TodoList
//
//  Created by Дарья Литвинова on 16.12.2025.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [ItemModel] = [
        ItemModel(title: "Дочитать книгу", isCompleted: false),
        ItemModel(title: "Купить мандарины", isCompleted: true),
        ItemModel(title: "Приготовить курицу", isCompleted: false)
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(items) { item in
                    ListRowView(item: item)
                }
                .onDelete(perform: deleteItem)
                .onMove(perform: moveItem)
            }
            .listStyle(.plain)
            .navigationTitle("Список дел")
            .toolbar() {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink("Добавить") {
                        AddView()
                    }
                }
            }
        }
    }
    
    private func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    private func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
}

#Preview {
    ListView()
}

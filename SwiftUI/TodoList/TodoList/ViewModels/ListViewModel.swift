//
//  ListViewModel.swift
//  TodoList
//
//  Created by Дарья Литвинова on 17.12.2025.
//

import Foundation
import SwiftUI
internal import Combine

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    private let keyValue = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
//        self.items = [
//            ItemModel(title: "Дочитать книгу", isCompleted: false),
//            ItemModel(title: "Купить мандарины", isCompleted: true),
//            ItemModel(title: "Приготовить курицу", isCompleted: false)
//        ]
        guard let data = UserDefaults.standard.data(forKey: keyValue),
              let decodedData = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        items = decodedData
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        items.append(ItemModel(title: title, isCompleted: false))
    }
    
    func updateItem(_ item: ItemModel) {
//        if let index = items.firstIndex { (existingItem) -> Bool in
//            return existingItem.id == item.id
//        } {
//            // run this code
//        }
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.toggleCompletion()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: keyValue)
        }
    }
}

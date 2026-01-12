//
//  ItemModel.swift
//  TodoList
//
//  Created by Дарья Литвинова on 16.12.2025.
//

import Foundation

// Immutable struct
// isCompleted константа, значит менять не можем, и в целом надо создавать новый экземпляр, самый оптимальный спобоб менять значения, если есть айди, через вот такую функцию toggleCompletion

struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func toggleCompletion() -> Self {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}

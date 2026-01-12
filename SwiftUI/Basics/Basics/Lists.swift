//
//  Lists.swift
//  Basics
//
//  Created by Дарья Литвинова on 18.11.2025.
//

import SwiftUI

struct Lists: View {
    @State private var fruits = ["Banana", "Apple", "Orange"]
    @State private var veggies = ["Carrot", "Potato", "Tomato"]
    
    var body: some View {
        NavigationStack {
            List {
                Section(
                    header:
                        HStack {
                            Text("Fruits")
                            Image(systemName: "flame.fill")
                        }
                        .foregroundStyle(.orange)
                ) {
                    // id: \.self означает, что каждый элемент массива уникален сам по себе, сам элемент используется как уникальный идентификатор
                    // это работает когда элементы уникальны и соответствуют протоколу Hashable
                    // это нужно, чтобы было понятно какое вью к какому элементу относится
                    // move так и не заработал как надо, что бы я не пробовала, упорно все возвращает к изначальному порядку коллекции
                ForEach(fruits, id: \.self) { fruit in
                        Text(fruit)
                    }
                    .onDelete { indexSet in
                        removeFruit(at: indexSet)
                    }
                    // можно так, наша функция удовлетворяет Optiona<(IndexSet) -> Void>
                    //.onDelete(perform: removeFruit)
                    // и так тоже можно
                    .onMove(perform: moveFruit(indices:newOffset:))
                }
                
                Section(
                    header:
                        Text("Veggies")
                ) {
                    // id: \.self означает, что каждый элемент массива уникален сам по себе, сам элемент используется как уникальный идентификатор
                    // это работает когда элементы уникальны и соответствуют протоколу Hashable
                    // это нужно, чтобы было понятно какое вью к какому элементу относится
                    ForEach(veggies, id: \.self) { veggies in
                        Text(veggies)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Grocery list")
            .toolbar {
                ToolbarItem(
                    placement: .topBarLeading,
                    content: {
                        EditButton()
                            .tint(.indigo)
                    }
                )
                
                ToolbarItem(
                    placement: .topBarTrailing,
                    content: {
                        Button("Add fruit") {
                            addFruit()
                        }
                        .tint(.green)
                    }
                )
            }
        }
    }
    
    private func addFruit() {
        fruits.append("Peach")
    }
    
    private func removeFruit(at offsets: IndexSet) {
        fruits.remove(atOffsets: offsets)
    }
    
    private func moveFruit(indices: IndexSet, newOffset: Int) {
        fruits.move(fromOffsets: indices, toOffset: newOffset)
    }
}

#Preview {
    Lists()
}

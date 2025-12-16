//
//  NavigationSplitViews.swift
//  Basics
//
//  Created by Дарья Литвинова on 14.12.2025.
//

import SwiftUI

enum FoodCategory: String, CaseIterable {
    case fruits, vegetebles, meats
}

enum Fruit: String, CaseIterable {
    case apple, banana, orange
}

// NavigationSplitView -> iPad, MacOS, VisionOS

struct NavigationSplitViews: View {
    
    @State private var visibility: NavigationSplitViewVisibility = .all
    @State private var selectedCategory: FoodCategory? = nil
    @State private var selectedFruit: Fruit? = nil
    
    var body: some View {
        // в таком виде не работает на ios надатие кнопок
        NavigationSplitView(columnVisibility: $visibility) {
//            List {
//                ForEach(FoodCategory.allCases, id: \.rawValue) { category in
//                    Button(category.rawValue.capitalized) {
//                        selectedCategory = category
//                    }
//                }
//            }
            // а так работает и на иос тоже
            List(FoodCategory.allCases, id: \.rawValue, selection: $selectedCategory) { category in
                // так не выделяется ячейка на которую нажимали
//                Button(category.rawValue.capitalized) {
//                    selectedCategory = category
//                }
                // а так выделяется
                NavigationLink(category.rawValue.capitalized, value: category)
            }
            .navigationTitle("Categories")
        } content: {
            if let selectedCategory {
                Group {
                    switch selectedCategory {
                    case .fruits:
//                        List {
//                            ForEach(Fruit.allCases, id: \.rawValue) {
//                                fruit in
//                                Button(fruit.rawValue.capitalized) {
//                                    selectedFruit = fruit
//                                }
//                            }
//                        }
                        List(Fruit.allCases, id: \.rawValue, selection: $selectedFruit) { fruit in
//                            Button(fruit.rawValue.capitalized) {
//                                selectedFruit = fruit
//                            }
                            NavigationLink(fruit.rawValue.capitalized, value: fruit)
                        }
                    case .vegetebles:
                        EmptyView()
                    case .meats:
                        EmptyView()
                    }
                }
                .navigationTitle("Fruits")
            }
        } detail: {
            if let selectedFruit {
                Text("You selected: \(selectedFruit.rawValue)")
                    .font(.largeTitle)
                    .navigationTitle(selectedFruit.rawValue.capitalized)
            }
        }
        .navigationSplitViewStyle(.balanced)
    }
}

#Preview {
    NavigationSplitViews()
}

//
//  SwipeActions.swift
//  Basics
//
//  Created by Дарья Литвинова on 07.12.2025.
//

import SwiftUI

struct SwipeActions: View {
    
    @State private var fruits: [String] = ["apple", "orange", "cherry", "banana", "mango"]
    
    var body: some View {
        List {
            ForEach(fruits, id: \.self) {
                Text($0.capitalized)
                    .swipeActions(
                        edge: .trailing,
                        // не позволяет полностью оттягивать и выполнять последнее действие в списке
                        allowsFullSwipe: false) {
                            Button("Archive") {
                            }
                            .tint(.blue)
                            Button("Save") {
                            }
                            .tint(.black)
                            Button("Junk") {
                            }
                            .tint(.green)
                        }
                        .swipeActions(
                            edge: .leading,
                            allowsFullSwipe: true) {
                                Button("Share") {
                                }
                                .tint(.yellow)
                            }
            }
        }
        //.onDelete(perform: delete(indexSet:))
    }
    
    private func delete(indexSet: IndexSet) {
        
    }
}

#Preview {
    SwipeActions()
}

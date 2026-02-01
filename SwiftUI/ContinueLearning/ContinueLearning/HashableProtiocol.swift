//
//  HashableProtiocol.swift
//  ContinueLearning
//
//  Created by Дарья Литвинова on 29.01.2026.
//

import SwiftUI

struct MyCustomModel: Hashable {
    let title: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
}

struct HashableProtiocol: View {
    
//    let data: [String] = [
//        "ONE", "TWO", "THREE", "FOUR", "FIVE", "FIVE"
//    ]
    let data: [MyCustomModel] = [
        MyCustomModel(title: "ONE"),
        MyCustomModel(title: "TWO"),
        MyCustomModel(title: "THREE"),
        MyCustomModel(title: "FOUR"),
        MyCustomModel(title: "FIVE"),
        MyCustomModel(title: "FIVE")
        ]
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                ForEach(data, id: \.self) { item in
                    Text(item.hashValue.description)
                        .font(.headline)
                }
            }
        }
    }
}

#Preview {
    HashableProtiocol()
}

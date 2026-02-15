//
//  MultipleSheets.swift
//  ContinueLearning
//
//  Created by Дарья Литвинова on 26.01.2026.
//

//struct RandomModel: Identifiable {
//    let id = UUID().uuidString
//    let title: String
//}

import SwiftUI

struct MultipleSheetsItem: View {
    @State private var selectedModel: RandomModel?
    
    var body: some View {
        VStack(spacing: 20) {
            //            Button("One") {
            //                selectedModel = RandomModel(title: "One")
            //            }
            //            Button("Two") {
            //                selectedModel = RandomModel(title: "Three")
            //            }
            ForEach(0..<50) { index in
                Button("Button \(index)") {
                    selectedModel = RandomModel(title: "\(index)")
                }
            }
            .sheet(item: $selectedModel) { model in
                NextScreennnn(selectedModel: model)
            }
        }
    }
}

struct NextScreennnn: View {
    let selectedModel: RandomModel
    
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

#Preview {
    MultipleSheets()
}

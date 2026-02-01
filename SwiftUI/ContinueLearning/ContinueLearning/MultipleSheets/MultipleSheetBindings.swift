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

struct MultipleSheetsBindings: View {
    @State private var selectedModel = RandomModel(title: "Starting title")
    @State private var showSheet: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Button("One") {
                selectedModel = RandomModel(title: "One")
                showSheet.toggle()
            }
            Button("Two") {
                selectedModel = RandomModel(title: "Two")
                showSheet.toggle()
            }
        }
        .sheet(isPresented: $showSheet) {
            NextScreenn(selectedModel: $selectedModel)
        }
    }
}

struct NextScreenn: View {
    @Binding var selectedModel: RandomModel
    
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

#Preview {
    MultipleSheets()
}

//
//  MultipleSheets.swift
//  ContinueLearning
//
//  Created by Дарья Литвинова on 26.01.2026.
//

struct RandomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}

import SwiftUI

// 3 варианта решения проблемы (в других файлах этой папки)
// 1 - bindings - говорили что сработает у меня не сработало, видимо что-то поменялось
// upd в симуляторе работает
// 2 - использовать несколько .sheet
// item - удобно когда куча sheets


struct MultipleSheets: View {
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
        // несмотря на то на какую кнопку тыкаем, первый раз всегда покажется Starting title, так как контент создается до фактического нажатия на кнопку, поэтому надо избавляться от любой логики тут, так как она все равно не будет работать
        .sheet(isPresented: $showSheet) {
            NextScreen(selectedModel: selectedModel)
        }
    }
}

struct NextScreen: View {
    let selectedModel: RandomModel
    
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

#Preview {
    MultipleSheets()
}

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

struct MultipleSheetsMultiple: View {
    @State private var selectedModel = RandomModel(title: "Starting title")
    @State private var showSheet: Bool = false
    @State private var showSheet2: Bool = false
    var body: some View {
        VStack(spacing: 20) {
            Button("One") {
                showSheet.toggle()
            }
            .sheet(isPresented: $showSheet) { NextScreennn(selectedModel: RandomModel(title: "One"))
            }
            Button("Two") {
                showSheet2.toggle()
            }
            // утвержали, что не заработает, потому что этот sheet дочерний от .sheet внешнего (который у VStack, поэтому не работает, но у меня появился этот
            // не работало это раньше, потом поправили, но все равно лучше так не делать, чтобы не путать пользователя и вообще
            .sheet(isPresented: $showSheet2) { NextScreennn(selectedModel: RandomModel(title: "Two"))
            }
        }
//        .sheet(isPresented: $showSheet) {
//            NextScreennn(selectedModel: selectedModel)
//        }
    }
}

struct NextScreennn: View {
    let selectedModel: RandomModel
    
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

#Preview {
    MultipleSheetsMultiple()
}

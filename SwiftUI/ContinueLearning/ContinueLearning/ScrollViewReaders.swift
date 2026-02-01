//
//  ScrollViewReaders.swift
//  ContinueLearning
//
//  Created by Дарья Литвинова on 25.01.2026.
//

import SwiftUI

struct ScrollViewReaders: View {
    @State private var textFieldText: String = ""
    @State private var scrollToIndex: Int = 0
    var body: some View {
        VStack {
            TextField("Enter a # here...", text: $textFieldText)
                .frame(height: 55)
                .padding(.horizontal)
                .border(.gray)
                .keyboardType(.numberPad)
            
            Button("Scroll now") {
                withAnimation(.spring()) {
                    if let index = Int(textFieldText) {
                        scrollToIndex = index
                    }
                }
            }
            
            ScrollView {
                // нужен для возможности скролла к определенному элементу
                ScrollViewReader { proxy in
                    ForEach(0..<50) { index in
                        Text("This is item #\(index)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .shadow(radius: 10)
                            .padding()
                            .id(index)
                    }
                    // если индекса такого не существует, то просто не перейдет, ошибок не будет
                    .onChange(of: scrollToIndex) { _, newValue in
                        withAnimation(.spring()) {
                            proxy.scrollTo(newValue, anchor: .top)
                        }
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ScrollViewReaders()
}

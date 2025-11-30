//
//  TextFields.swift
//  Basics
//
//  Created by Дарья Литвинова on 20.11.2025.
//

import SwiftUI

struct TextFields: View {
    @State private var text: String = ""
    @State private var textArray: [String] = []
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Type something here...", text: $text)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                    .foregroundStyle(.black.opacity(0.5))
                    .font(.headline)
                
                Button {
                    if isTextApproriate() {
                        saveText()
                        text = ""
                    }
                } label: {
                    Text("Save")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.indigo)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 15.0))
                }
                .disabled(!isTextApproriate())
                
                ForEach(textArray, id: \.self) { text in
                    Text(text)
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Try textfield!")
        }
    }
    
    private func saveText() {
        textArray.append(text)
    }
    
    private func isTextApproriate() -> Bool {
        return text.count >= 3
    }
}

#Preview {
    TextFields()
}

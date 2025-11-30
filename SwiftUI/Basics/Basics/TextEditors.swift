//
//  TextEditors.swift
//  Basics
//
//  Created by Дарья Литвинова on 20.11.2025.
//

import SwiftUI

struct TextEditors: View {
    @State private var text: String = ""
    @State private var savedText = ""
    var body: some View {
        NavigationStack {
            VStack(spacing: 20.0) {
                TextEditorWithPlaceholder(placeholder: "Type something...", text: $text)
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                    .shadow(radius: 10)
                    .foregroundStyle(.brown)
                    
                Button {
                    savedText = text
                    text = ""
                } label: {
                    Text("Save")
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(.orange)
                .foregroundStyle(.white)
                .clipShape(Capsule())
                
                Text(savedText)
                
                Spacer()

            }
            .padding()
            .navigationTitle("Try text editors!")
        }
    }
}

struct TextEditorWithPlaceholder: View {
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            TextEditor(text: $text)
            
            if text.isEmpty {
                Text("Type something...")
                    .foregroundStyle(.gray)
                    .padding(8)
            }
        }
    }
}

#Preview {
    TextEditors()
}

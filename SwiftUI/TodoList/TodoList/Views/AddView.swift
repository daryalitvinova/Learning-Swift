//
//  AddView.swift
//  TodoList
//
//  Created by Дарья Литвинова on 16.12.2025.
//

import SwiftUI

struct AddView: View {
    
    @State var textFieldText: String = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    TextField("Начните писать что-нибудь...", text: $textFieldText)
                        .frame(height: 55)
                        .padding(.horizontal)
                        .background(Color(#colorLiteral(red: 0.9347706437, green: 0.9347706437, blue: 0.9347706437, alpha: 1)))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Button("Save") {
                        
                    }
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(.accent)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                }
                .padding(14)
            }
            .navigationTitle("Добавить")
        }
    }
}

#Preview {
    AddView()
}

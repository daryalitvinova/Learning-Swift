//
//  AddView.swift
//  TodoList
//
//  Created by Дарья Литвинова on 16.12.2025.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var viewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State private var alertTitle: String = ""
    @State private var showAlert: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    TextField("Начните писать что-нибудь...", text: $textFieldText)
                        .frame(height: 55)
                        .padding(.horizontal)
                        .background(Color(UIColor.secondarySystemBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Button {
                        saveButtonPressed()
                    } label: {
                        Text("Save")
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.accent)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                .padding(14)
            }
            .navigationTitle("Добавить")
            .alert("Error", isPresented: $showAlert) {
                Button("Ok") { }
            } message: {
                Text(alertTitle)
            }

        }
    }
    
    private func saveButtonPressed() {
        if textIsAppropriate() {
            viewModel.addItem(title: textFieldText)
            dismiss()
        }
    }
    
    private func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "New todo item must be at least 3 characters long!"
            showAlert.toggle()
            return false
        }
        return true
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationStack {
                AddView()
            }
            .environmentObject(ListViewModel())
            .preferredColorScheme(.light)
            NavigationStack {
                AddView()
            }
            .environmentObject(ListViewModel())
            .preferredColorScheme(.dark)
        }
    }
}

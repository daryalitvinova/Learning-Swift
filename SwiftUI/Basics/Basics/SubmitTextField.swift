//
//  SubmitTextField.swift
//  Basics
//
//  Created by Дарья Литвинова on 07.12.2025.
//

import SwiftUI

struct SubmitTextField: View {
    
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            TextField("Placeholder...", text: $text)
                .submitLabel(.route)
                .onSubmit {
                    print("Something to the console!")
                }
            TextField("Placeholder...", text: $text)
                .submitLabel(.next)
                .onSubmit {
                    print("Something to the console!")
                }
            TextField("Placeholder...", text: $text)
                .submitLabel(.search)
                .onSubmit {
                    print("Something to the console!")
                }
        }
    }
}

#Preview {
    SubmitTextField()
}

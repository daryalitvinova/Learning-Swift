//
//  Ternaries.swift
//  Basics
//
//  Created by Дарья Литвинова on 15.11.2025.
//

import SwiftUI

struct Ternaries: View {
    @State private var state = false
    var body: some View {
        VStack {
            Button("Button: \(state.description)") {
                state.toggle()
            }
            
            RoundedRectangle(cornerRadius: state ? 10 : 0)
                .fill(state ? .blue : .pink)
                .frame(
                    width: state ? 200 : 50,
                    height: state ? 100 : 150)
                
            
            Spacer()
        }
    }
}

#Preview {
    Ternaries()
}

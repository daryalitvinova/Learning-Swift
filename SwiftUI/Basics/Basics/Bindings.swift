//
//  Bindings.swift
//  Basics
//
//  Created by Дарья Литвинова on 15.11.2025.
//

import SwiftUI

struct Bindings: View {
    @State var backgroundColor = Color.blue
    
    var body: some View {
        ZStack {
            // background
            backgroundColor
                .ignoresSafeArea()
            
            // content
            ButtonView(backgroundColor: $backgroundColor)
        }
    }
}

struct ButtonView: View {
    // нужна если надо изменить что-то извне
    @Binding var backgroundColor: Color
    // если в этом вью меняем достаточно state
    @State var buttonColor: Color = .pink
    
    var body: some View {
        Button(action: {
            backgroundColor = .orange
            buttonColor = .yellow
        }, label : {
            Text("Button")
                .foregroundStyle(.white)
                .padding()
                .padding(.horizontal)
                .background(buttonColor)
                .clipShape(RoundedRectangle(cornerRadius: 15))
        })
    }
}

#Preview {
    Bindings()
}

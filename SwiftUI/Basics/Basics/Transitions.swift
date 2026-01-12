//
//  Transitions.swift
//  Basics
//
//  Created by Дарья Литвинова on 16.11.2025.
//

import SwiftUI

struct Transitions: View {
    @State private var showView = false
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                Button("Tap me") {
                    withAnimation(.easeInOut) {
                        showView.toggle()
                    }
                }
                
                Spacer()
            }
            
            // исчезает, но по факту остается на экране, просто невидимый, лучше использовать transition
            /*RoundedRectangle(cornerRadius: 10.0)
                .frame(height: UIScreen.main.bounds.height * 0.5)
                .opacity(showView ? 1.0 : 0.0)
                .animation(.easeInOut, value: showView)*/
            if showView {
                RoundedRectangle(cornerRadius: 10.0)
                    .frame(height: UIScreen.main.bounds.height * 0.5)
                    //.transition(.move(edge: .bottom))
                    .transition(AnyTransition.scale.animation(.easeInOut))
                    //.transition(.asymmetric(
                    //    insertion: .move(edge: .bottom),
                    //    removal: AnyTransition.opacity.animation(.easeOut)))
            }
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    Transitions()
}

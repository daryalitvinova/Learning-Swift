//
//  PopUps.swift
//  Basics
//
//  Created by Дарья Литвинова on 17.11.2025.
//

import SwiftUI

struct PopUps: View {
    @State private var showScreen = false
    
    var body: some View {
        ZStack {
            Color.orange
                .ignoresSafeArea()
            
            VStack {
                Button("Button") {
                    withAnimation(.spring) {
                        showScreen.toggle()
                    }
                }
                .font(.title)
                
                Spacer()
            }
            
            // METHOD 1 - SHEET
//            .sheet(isPresented: $showScreen) {
//                NewScreen()
//            }
            
            // METHOD 2 - TRANSITION
//            ZStack {
//                if showScreen {
//                    NewScreen(showScreen: $showScreen)
//                        .padding(.top, 100)
//                        .transition(.move(edge: .bottom))
//                        //.animation(.spring, value: showScreen)
//                }
//            }
//            // для плавного исчезновения экрана. Иначе он удаляется из иерархии слишком рано, переход не успевает проиграться. А так мы по сути говорим, что тут этот слой самый верхний, его нельзя удалять пока не завершится анимация, мы задали порядок view
//            .zIndex(2.0)
            
            // METHOD 3 - ANIMATION OFFSET
            NewScreen(showScreen: $showScreen)
                .padding(.top, 100)
                .offset(y: showScreen ? 0 : UIScreen.main.bounds.height)
        }
    }
}

struct NewScreen: View {
    @Environment(\.dismiss) private var dismiss
    
    @Binding var showScreen: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.purple
                .ignoresSafeArea()
            
            Button(action: {
                //dismiss()
                withAnimation(.spring) {
                    showScreen.toggle()
                }
            }, label: {
                Image(systemName: "xmark")
                    .font(.title)
                    .foregroundStyle(.white)
                    .padding(20)
            })
        }
    }
}

#Preview {
    PopUps()
    //NewScreen()
}

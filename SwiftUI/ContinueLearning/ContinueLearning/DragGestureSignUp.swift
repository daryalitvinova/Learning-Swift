//
//  DragGestureSignUp.swift
//  ContinueLearning
//
//  Created by Дарья Литвинова on 25.01.2026.
//

import SwiftUI

struct DragGestureSignUp: View {
    @State private var startingOffsetY: CGFloat = UIScreen.main.bounds.height * 0.83
    @State private var currentDragOffsetY: CGFloat = 0
    @State private var endingOffsetY: CGFloat = 0
    var body: some View {
        ZStack {
            Color.indigo.opacity(0.5).ignoresSafeArea()
            
            SignUp()
                .offset(y: startingOffsetY)
                .offset(y: currentDragOffsetY)
                .offset(y: endingOffsetY)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation(.spring()) {
                                currentDragOffsetY = value.translation.height
                            }
                        }
                        .onEnded { value in
                            withAnimation(.spring()) {
                                // Чем выше вытягиваем тем currentDragOffsetY меньше
                                if currentDragOffsetY < -150 {
                                    endingOffsetY = -startingOffsetY // по сути отменяем начальных офсет
                                } else if endingOffsetY != 0 && currentDragOffsetY > 150 {
                                    endingOffsetY = 0
                                }
                                currentDragOffsetY = 0
                            }
                        }
                )
            Text("\(currentDragOffsetY)")
        }
    }
}

struct SignUp: View {
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack(spacing: 25) {
                Image(systemName: "chevron.up")
                Text("Sign up")
                    .font(.headline)
                Image(systemName: "flame.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                Text("This is the description for our app. And I need looong desciption. Longer, longer, longer. Bla-bla-bla tro-lo-lo")
                    .multilineTextAlignment(.center)
                Text("CREATE AN ACCOUNT")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(.black)
                    .clipShape(Capsule())
                Spacer()
            }
            .padding()
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    DragGestureSignUp()
}

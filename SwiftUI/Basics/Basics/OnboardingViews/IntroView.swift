//
//  IntroView.swift
//  Basics
//
//  Created by Дарья Литвинова on 04.12.2025.
//

import SwiftUI

struct IntroView: View {
    
    @AppStorage("signed_in") var currentUserSighedIn = false
    
    var body: some View {
        ZStack {
            RadialGradient(
                colors: [Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))],
                center: .topLeading,
                startRadius: 5,
                endRadius: UIScreen.main.bounds.height)
            .ignoresSafeArea()
            
            if currentUserSighedIn {
                ProfileView()
                    .transition(.asymmetric(
                        insertion: .move(edge: .bottom),
                        removal: .move(edge: .top)))
            } else {
                OnboardingView()
                    .transition(.move(edge: .top))
            }
        }
        .animation(.default, value: currentUserSighedIn)
    }
}

#Preview {
    IntroView()
}

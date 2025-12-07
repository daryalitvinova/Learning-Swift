//
//  ProfileView.swift
//  Basics
//
//  Created by Дарья Литвинова on 05.12.2025.
//

import SwiftUI

struct ProfileView: View {
    
    @AppStorage("name") private var name: String?
    @AppStorage("age") private var age: Int?
    @AppStorage("gender") private var gender: String?
    @AppStorage("signed_in") private var signedIn: Bool?
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width:150, height: 150)
            Text(name ?? "Your name here")
            Text("User age is \(age ?? 0)")
            Text("User gender is \(gender ?? "Unknown")")
            
            Button(action: {
                signOut()
            }) {
                Text("Sign Out")
                .padding()
                .padding(.horizontal, 15)
                .background(Capsule(style: .continuous).fill(Color.indigo))
                .foregroundStyle(.white)
            }
        }
        .foregroundStyle(.indigo)
        .padding()
        .padding(.vertical, 50)
        .font(.title)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(.white))
        .shadow(radius: 10, y: 5)
    }
}

#Preview {
    ProfileView()
}

// MARK: FUNCTIONS
extension ProfileView {
    private func signOut() {
        name = nil
        age = nil
        gender = nil
        withAnimation {
            signedIn = false
        }
    }
}

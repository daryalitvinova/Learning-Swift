//
//  FocusStates.swift
//  Basics
//
//  Created by Дарья Литвинова on 07.12.2025.
//

import SwiftUI

struct FocusStates: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    //@FocusState private var usernameInFocus: Bool
    //@FocusState private var passwordInFocus: Bool
    private enum OnboardingField {
        case username
        case password
    }
    @FocusState private var fieldInFocus: OnboardingField?
    
    var body: some View {
        VStack {
            TextField("Add your name here...", text: $username)
                //.focused($usernameInFocus)
                .focused($fieldInFocus, equals: .username)
                .padding(.leading)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.gray.brightness(0.3))
                .cornerRadius(10)
            
            TextField("Add your password here...", text: $password)
                //.focused($passwordInFocus)
                .focused($fieldInFocus, equals: .password)
                .padding(.leading)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.gray.brightness(0.3))
                .cornerRadius(10)
            
            Button("Sign up") {
                let usernameIsValid = !username.isEmpty
                let passwordIsValid = !password.isEmpty
                
                if usernameIsValid && passwordIsValid {
                    print("Signed up")
                } else if usernameIsValid {
                    fieldInFocus = .password
                    //passwordInFocus = true
                    //usernameInFocus = false
                } else if passwordIsValid {
                    fieldInFocus = .username
                    //usernameInFocus = true
                    //passwordInFocus = false
                }
            }
        }
        .padding()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                //self.usernameInFocus = true
                self.fieldInFocus = .username
            }
        }
    }
}

#Preview {
    FocusStates()
}

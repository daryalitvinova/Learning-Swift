//
//  OnboardingView.swift
//  Basics
//
//  Created by Дарья Литвинова on 04.12.2025.
//

import SwiftUI

enum OnboardingStep: CaseIterable {
    case welcome
    case name
    case age
    case gender
    
    var next: OnboardingStep? {
        let all = Self.allCases
        if let index = all.firstIndex(of: self),
           index + 1 < all.count {
            return all[index + 1]
        }
        return nil
    }
}

struct OnboardingView: View {
    
    // States
    @State private var onboardingStep: OnboardingStep? = .welcome
    private let transition: AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge: .leading))
    
    // Alert
    @State private var showAlert: Bool = false
    @State private var alertTitle: String = ""
    
    // Inputs
    @State private var name: String = ""
    @State private var age: Double = 35
    @State private var gender: String = ""
    
    // App storage
    @AppStorage("name") private var currentUserName: String?
    @AppStorage("age") private var currentUserAge: Int?
    @AppStorage("gender") private var currentUserGender: String?
    @AppStorage("signed_in") var currentUserSighedIn = false
    
    var body: some View {
        ZStack {
            // content
            switch onboardingStep {
            case .welcome:
                welcomeView
                    .transition(transition)
            case .name:
                nameView
                    .transition(transition)
            case .age:
                ageView
                    .transition(transition)
            case .gender:
                genderView
                    .transition(transition)
            default:
                Text("signed in")
            }
            // buttons
            VStack {
                Spacer()
                
                signInButton
            }
            .padding(30)
        }
        .alert(isPresented: $showAlert) {
            return Alert(title: Text(alertTitle))
        }
    }
    
    private var signInButton: some View {
        Button(action: {
            nextButtonTapped()
        }) {
            Text(signInButtonTitle)
            .foregroundStyle(.indigo)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(.white)
            .font(.headline)
            .clipShape(RoundedRectangle(cornerRadius: 15))
        }
    }
    
    private var signInButtonTitle: String {
        switch onboardingStep {
        case .welcome: return "Sign In"
        case .gender: return "Finish"
        default: return "Next"
        }
    }
}

#Preview {
    OnboardingView()
        .background(Color.indigo)
        .ignoresSafeArea()
}

// MARK: COMPONENTS
extension OnboardingView {
    private var welcomeView: some View {
        VStack(spacing: 30) {
            Spacer()
            Image(systemName: "heart.text.square.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            Text("Find your match")
                .font(.largeTitle)
                .foregroundStyle(.white)
                .fontWeight(.medium)
                .background(Capsule(style: .continuous)
                    .frame(height: 3)
                    .offset(y: 5)
                    .foregroundStyle(.white),
                            alignment: .bottom)
            Text("This is the #1 app for finding your match online! In this tutorial we are practicing using AppStorage and other SwiftUI techniques.")
            
            Spacer()
            Spacer()
                
        }
        .multilineTextAlignment(.center)
        .foregroundStyle(.white)
        .padding(30)
    }
    
    private var nameView: some View {
        VStack(spacing: 30) {
            Spacer()
            Text("What is your name?")
                .font(.largeTitle)
                .foregroundStyle(.white)
                .fontWeight(.medium)
            
            TextField("Your name here", text: $name)
                .font(.headline)
                .frame(height: 55)
                .padding(.horizontal)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            Spacer()
            Spacer()
        }
        .padding(30)
    }
    
    private var ageView: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("What is your age?")
                .font(.largeTitle)
                .fontWeight(.medium)
            
            Text(String(format: "%.0f", age))
                .font(.largeTitle)
                .foregroundStyle(Color(#colorLiteral(red: 0.8840534091, green: 0.8810790181, blue: 0.9273056388, alpha: 1)))
            Slider(value: $age, in: 18...100, step: 1)
                .tint(Color(#colorLiteral(red: 0.7961432338, green: 0.785433948, blue: 0.9353124499, alpha: 1)))
            Spacer()
            Spacer()
        }
        .foregroundStyle(.white)
        .padding(30)
    }
    
    private var genderView: some View {
        VStack {
            Spacer()
            Text("What is your gender?")
                .font(.largeTitle)
                .fontWeight(.medium)
                .foregroundStyle(.white)
            Menu {
                Picker(
                    selection: $gender,
                    content: {
                        Text("Male").tag("Male")
                        Text("Female").tag("Female") },
                    label: { EmptyView() })
            } label: {
                Text(gender.isEmpty ? "Select a gender" : gender)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).foregroundStyle(.white))
                    .foregroundStyle(.indigo)
            }
            
            
            Spacer()
            Spacer()
        }
        .padding(30)
    }
}

// MARK: FUNCTIONS
extension OnboardingView {
    private func nextButtonTapped() {
        switch onboardingStep {
        case .name:
            guard name.count > 3 else {
                showAlert(title: "Name must be longer than 3 characters")
                return
            }
        case .gender:
            guard !gender.isEmpty else {
                showAlert(title: "You have to select a gender")
                return
            }
        default: break
        }
        
        if onboardingStep == .gender {
            signIn()
        } else {
            withAnimation {
                onboardingStep = onboardingStep?.next
            }
        }
    }
    
    private func showAlert(title: String) {
        alertTitle = title
        showAlert.toggle()
    }
    
    private func signIn() {
        currentUserName = name
        currentUserAge = Int(age)
        currentUserGender = gender
        withAnimation {
            currentUserSighedIn = true
        }
    }
}

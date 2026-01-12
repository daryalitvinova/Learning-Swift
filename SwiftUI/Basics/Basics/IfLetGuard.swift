//
//  IfLetGuard.swift
//  Basics
//
//  Created by Дарья Литвинова on 30.11.2025.
//

import SwiftUI

struct IfLetGuard: View {
    @State private var displayText: String? = nil
    @State private var isLoading: Bool = false
    @State private var currentUserId: String? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Here we are practicing safe coding")
                
                if let text = displayText {
                    Text(text)
                        .font(.title)
                }
                
                if isLoading {
                    ProgressView()
                }
                
                Spacer()
            }
            .onAppear {
                loadData()
            }
            .navigationTitle("Safe Coding")
        }
    }
    
    private func loadData() {
        guard let userId = currentUserId else {
            displayText = "Error. There is no user ID"
            return
        }
        
        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            displayText = "This is the new data. User Id: \(userId)"
            isLoading = false
        }
        
//        if let userId = currentUserId {
//            isLoading = true
//            
//            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//                displayText = "This is the new data. User Id: \(userId)"
//                isLoading = false
//            }
//        } else {
//            displayText = "Error. There is no user ID"
//        }
    }
}

#Preview {
    IfLetGuard()
}

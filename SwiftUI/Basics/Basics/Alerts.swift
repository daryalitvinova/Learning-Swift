//
//  Alerts.swift
//  Basics
//
//  Created by Дарья Литвинова on 19.11.2025.
//

import SwiftUI

struct Alerts: View {
    @State private var backgroundColor = Color.gray.opacity(0.5)
    @State private var showAlert = false
    @State private var alertType: AlertType? = nil
    
    enum AlertType {
        case success
        case error
    }
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea(.all)
            
            VStack {
                Button("Button 1") {
                    alertType = .success
                    showAlert.toggle()
                }
                Button("Button 2") {
                    alertType = .error
                    showAlert.toggle()
                }
            }
            .alert(isPresented: $showAlert, content: {
                getAlert(type: alertType)
            })
        }
    }
    
    private func getAlert(type: AlertType?) -> Alert {
        switch type {
        case .success:
            return Alert(title: Text("Success"))
        case .error:
            return Alert(
                title: Text("There is an error"),
                primaryButton: .cancel(),
                secondaryButton: .destructive(Text("Delete"),
                                              action: {
                                                  backgroundColor = .red
                                              })
            )
        default:
            return Alert(title: Text("No such type"))
        }
    }
}

#Preview {
    Alerts()
}

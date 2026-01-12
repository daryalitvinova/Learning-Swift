//
//  ActionSheets.swift
//  Basics
//
//  Created by Дарья Литвинова on 20.11.2025.
//

import SwiftUI

struct ActionSheets: View {
    @State private var showActionSheet = false
    @State private var selectedAction: Action = .otherPost
    
    enum Action {
        case otherPost
        case myPost
    }
    
    var body: some View {
        VStack {
            HStack {
                Circle()
                    .frame(width: 30, height: 30)
                
                Text("@username")
                
                Spacer()
                
                Button {
                    showActionSheet.toggle()
                } label: {
                    Image(systemName: "ellipsis")
                }
                .tint(.primary)
            }
            .padding(.horizontal)
            
            Rectangle()
                .aspectRatio(1.0, contentMode: .fit)
        }
        .confirmationDialog("Choose option", isPresented: $showActionSheet, titleVisibility: .visible) {
            
            switch selectedAction {
            case .myPost:
                Button("Delete", role: .destructive) { }
                Button("Cancel", role: .close) { }
            case .otherPost:
                Button("Share", role: .confirm) { }
                Button("Report", role: .destructive) { }
            }
        }
    }
}

#Preview {
    ActionSheets()
}

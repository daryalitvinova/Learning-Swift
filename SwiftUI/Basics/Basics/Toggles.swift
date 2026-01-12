//
//  Toggles.swift
//  Basics
//
//  Created by Дарья Литвинова on 20.11.2025.
//

import SwiftUI

struct Toggles: View {
    @State private var isOn = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Status:")
                Text(isOn ? "Online" : "Offline")
            }
            .font(.title)
            
            Toggle("Change status:", isOn: $isOn)
                .toggleStyle(.switch)
                .tint(.custom)
            
            Spacer()
        }
        .padding(.horizontal, 100)
    }
}

#Preview {
    Toggles()
}

//
//  Pudding.swift
//  Basics
//
//  Created by Дарья Литвинова on 10.11.2025.
//

import SwiftUI

struct Pudding: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom, 20)
            
            Text("This is the description of what we will do on this screen. It is multiple lines and we will allign the text to the leading edge.")
        }
        .padding()
        .padding(.vertical, 10)
        .background(
            Color.white
                .cornerRadius(10)
                .shadow(
                    color: .black.opacity(0.3),
                    radius: 10,
                    x: 0,
                    y: 10)
        )
        .padding(.horizontal, 20)
    }
}

#Preview {
    Pudding()
}

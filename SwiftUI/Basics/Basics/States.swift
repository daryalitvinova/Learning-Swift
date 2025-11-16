//
//  States.swift
//  Basics
//
//  Created by Дарья Литвинова on 14.11.2025.
//

import SwiftUI

struct States: View {
    
    @State var backgroundColor = Color.red
    @State var myTitle = "My title"
    @State var count = 0
    
    var body: some View {
        ZStack {
            // background
            backgroundColor
                .ignoresSafeArea()
            
            // content
            VStack(spacing: 20) {
                Text(myTitle)
                    .font(.title)
                
                Text("Count: \(count)")
                    .font(.headline)
                    .underline()
                
                HStack(spacing: 20) {
                    Button("Increase") {
                        self.myTitle = "Increased"
                        self.count += 1
                        self.backgroundColor = .green
                    }
                    .padding()
                    .background(
                        Capsule()
                            .stroke(lineWidth: 2)
                    )
                    
                    Button("Decrease") {
                        self.myTitle = "Decreased"
                        self.count -= 1
                        self.backgroundColor = .orange
                    }
                    .padding()
                    .background(
                        Capsule()
                            .stroke(lineWidth: 2)
                        )
                }
                .font(.headline)
            }
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    States()
}

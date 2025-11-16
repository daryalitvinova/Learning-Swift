//
//  Conditionals.swift
//  Basics
//
//  Created by Дарья Литвинова on 15.11.2025.
//

import SwiftUI

struct Conditionals: View {
    @State var showCircle: Bool = false
    @State var showRectangle: Bool = false
    @State var isLoading: Bool = false
    
    var body: some View {
        VStack {
            Button("Show Circle: \(showCircle.description)") {
                showCircle.toggle()
            }
            
            Button("Show Rectangle: \(showRectangle.description)") {
                showRectangle.toggle()
            }
            
            if showCircle {
                Circle()
                    .stroke(lineWidth: 4)
                    .blur(radius: 2)
                    .frame(width: 100, height: 100)
            }
            if showRectangle {
                Rectangle()
                    .fill(.custom)
                    .frame(width: 100, height: 100)
            }
            
            if !showCircle && !showRectangle {
                Capsule()
                    .frame(width: 200, height: 100)
            }
            
            Spacer()
            
            Button("Loading: \(isLoading.description)") {
                isLoading.toggle()
            }
            
            if isLoading {
                ProgressView()
            }
            
            Spacer()
        }
    }
}

#Preview {
    Conditionals()
}

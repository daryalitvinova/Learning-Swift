//
//  Sliders.swift
//  Basics
//
//  Created by Дарья Литвинова on 21.11.2025.
//

import SwiftUI

struct Sliders: View {
    @State private var opacity: Double = 1.0
    @State private var backgroundColor: Color = .mint
    
    var body: some View {
        ZStack {
            backgroundColor
                .opacity(opacity)
                .ignoresSafeArea()
            
            VStack {
                Text("Opacity: \(String(format: "%.1f", opacity))")
                
                //Slider(value: $opacity)
                //Slider(value: $opacity, in: 0.0...1.0)
                Slider(value: $opacity,
                       in: 0.0...1.0,
                       step: 0.1,
                       onEditingChanged: { _ in
                    backgroundColor = .indigo},
                       minimumValueLabel: Text("0.0"),
                       maximumValueLabel: Text("1.0"),
                       label: {
                    Text("Title")
                })
                    .tint(.pink)
            }
            .padding()
        }
    }
}

#Preview {
    Sliders()
}

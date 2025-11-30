//
//  ColorPickers.swift
//  Basics
//
//  Created by Дарья Литвинова on 21.11.2025.
//

import SwiftUI

struct ColorPickers: View {
    @State private var backgroundColor = Color.red
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea(.all)
            
            ColorPicker("Select a color",
                        selection: $backgroundColor,
                        supportsOpacity: true)
            .padding()
            .background(.black)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10.0))
            .padding()
            .font(.headline)
        }
    }
}

#Preview {
    ColorPickers()
}

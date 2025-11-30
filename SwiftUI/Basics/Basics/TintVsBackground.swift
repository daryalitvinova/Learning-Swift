//
//  TintVsForeground.swift
//  Basics
//
//  Created by Дарья Литвинова on 21.11.2025.
//

import SwiftUI

struct TintVsBackground: View {
    var body: some View {
        VStack(spacing: 30) {
            
            // подстраивается под элемент, меняет системный цыет элемента
            Button("Tint") { }
                .buttonStyle(.borderedProminent)
                .tint(.green)
            
            // просто закрашивает фон как прямоугольник, по сути не сам даже элемент красит, а просто вью
            Button("Background") { }
                .buttonStyle(.borderedProminent)
                .background(.yellow)
            
            Button("Tint + Background") { }
                .buttonStyle(.borderedProminent)
                .tint(.purple)
                .background(.orange)
        }
        .padding()
    }
}

#Preview {
    TintVsBackground()
}

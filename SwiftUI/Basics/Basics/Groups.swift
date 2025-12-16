//
//  Groups.swift
//  Basics
//
//  Created by Дарья Литвинова on 11.12.2025.
//

import SwiftUI

struct Groups: View {
    var body: some View {
        VStack(spacing: 50) {
            Text("Hello, world!")
            
            // можно объединить их в еще 1 VStack, но по сути то он нам не нужон, нам нужен только 1 стек
            VStack {
                Text("Hello, world!")
                Text("Hello, world!")
            }
            .foregroundStyle(.cyan)
            .font(.caption)
            
            // Можно объединить их в группу для этих целей
            Group {
                Text("Hello, world!")
                Text("Hello, world!")
            }
            .foregroundStyle(.cyan)
            .font(.caption)
        }
        // применяются ко всем, а если надо только к 2 например?
        .foregroundStyle(.red)
        .font(.headline)
    }
}

#Preview {
    Groups()
}

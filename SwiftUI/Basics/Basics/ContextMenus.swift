//
//  ContextMenus.swift
//  Basics
//
//  Created by Дарья Литвинова on 20.11.2025.
//

import SwiftUI

struct ContextMenus: View {
    @State private var backgroundColor = Color.indigo
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            Image(systemName: "house.fill")
                .font(.title)
            Text("Context Menu")
                .font(.headline)
            Text("How to use Context Menu")
                .font(.subheadline)
        }
        .foregroundStyle(.white)
        .padding(30)
        .background(backgroundColor.clipShape(RoundedRectangle(cornerRadius: 30)))
        .contextMenu {
            Button {
                backgroundColor = .orange
            } label: {
                Label("Share post", systemImage: "flame.fill")
            }
            Button {
                backgroundColor = .red
            } label: {
                Text("Report post")
            }
            Button {
                backgroundColor = .brown
            } label: {
                HStack {
                    Text("Like post")
                    Image(systemName: "heart.fill")
                        .tint(.red)
                }
            }
        }
    }
}

#Preview {
    ContextMenus()
}

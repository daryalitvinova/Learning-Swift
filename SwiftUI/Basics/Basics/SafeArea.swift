//
//  SafeArea.swift
//  Basics
//
//  Created by Дарья Литвинова on 12.11.2025.
//

import SwiftUI

struct SafeArea: View {
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea(edges: .all)
            ScrollView {
                VStack {
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                        .font(.title)
                    
                    ForEach(0..<15) { index in
                        RoundedRectangle(cornerRadius: 25.0)
                            .fill(.white)
                            .frame(height: 150)
                            .shadow(color: .gray, radius: 10)
                            .padding()
                    }
                }
                .background(
                    Color.gray
                    //.ignoresSafeArea(edges: .all)
                )
            }
//            .background(
//                Color.red
//                //.ignoresSafeArea(edges: .all)
//            )
        }
    }
}

#Preview {
    SafeArea()
}

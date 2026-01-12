//
//  SafeAreaInsets.swift
//  Basics
//
//  Created by Дарья Литвинова on 11.12.2025.
//

import SwiftUI

struct SafeAreaInsets: View {
    var body: some View {
        NavigationStack {
            List(0..<10) { _ in
                Rectangle()
                    .frame(height: 100)
            }
            .navigationTitle("Safe Area Insets")
            .navigationBarTitleDisplayMode(.inline)
            // минус что надо контролировать safeAres ли это, остались ли мы в ней
//            .overlay(
//                Text("Hi")
//                    .frame(maxWidth: .infinity)
//                    .padding()
//                    .background(Color.yellow)
//                , alignment: .bottom
//            )
            .safeAreaInset(edge: .bottom, alignment: .center) {
                Text("Hi")
                    .frame(maxWidth: .infinity)
                    //.padding()
                    .background(Color.yellow)
                    //.clipShape(Circle())
                    //.padding()
            }
//            .safeAreaInset(edge: .top, alignment: .center) {
//                Text("Hi")
//                    .frame(maxWidth: .infinity)
//                    //.padding()
//                    .background(Color.yellow)
//                    //.background(Color.yellow.edgesIgnoringSafeArea(.bottom))
//                    //.clipShape(Circle())
//                    //.padding()
//            }
            .safeAreaInset(edge: .top, alignment: .trailing, spacing: nil) {
                Text("Hi")
                    //.frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.yellow)
                    //.background(Color.yellow.edgesIgnoringSafeArea(.bottom))
                    .clipShape(Circle())
                    .padding()
            }
        }
    }
}

#Preview {
    SafeAreaInsets()
}

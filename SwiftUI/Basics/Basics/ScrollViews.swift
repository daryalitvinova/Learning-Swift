//
//  ScrollViews.swift
//  Basics
//
//  Created by Дарья Литвинова on 11.11.2025.
//

import SwiftUI

struct ScrollViews: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<100) { index in
                    ScrollView(.horizontal) {
                        LazyHStack {
                            ForEach(0..<50) { index in
                                RoundedRectangle(cornerRadius: 25.0)
                                    .fill(Color(/*hue: .random(in: 0...1), saturation: .random(in: 0...1), brightness: .random(in: 0...1)*/
                                        red: .random(in: 0...1),
                                        green: .random(in: 0...1),
                                        blue: .random(in: 0...1)))
                                    .frame(width: 200, height: 150)
                                    .shadow(radius: 10)
                                    .padding()
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                }
            }
        }
    }
}

#Preview {
    ScrollViews()
}

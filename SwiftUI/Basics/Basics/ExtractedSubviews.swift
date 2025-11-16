//
//  ExtractedSubviews.swift
//  Basics
//
//  Created by Дарья Литвинова on 15.11.2025.
//

import SwiftUI

struct ExtractedSubviews: View {
    var body: some View {
        ZStack {
            // background
            Color.gray
                .ignoresSafeArea()
            
            //content
            contentLayer
        }
    }
    
    var contentLayer: some View {
        HStack {
            ExtractedView(count: 1, fruit: "Apples", backgroundColor: .red)
            ExtractedView(count: 15, fruit: "Oranges", backgroundColor: .orange)
            ExtractedView(count: 100, fruit: "Bananas", backgroundColor: .yellow)
        }
    }
}

struct ExtractedView: View {
    var count: Int
    var fruit: String
    var backgroundColor: Color
    
    var body: some View {
        VStack {
           Text("\(count)")
           Text(fruit)
       }
       .padding()
       .background(backgroundColor)
       .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    ExtractedSubviews()
}

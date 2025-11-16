//
//  ExtractedFunctions.swift
//  Basics
//
//  Created by Дарья Литвинова on 14.11.2025.
//

import SwiftUI

struct ExtractedFunctions: View {
    @State var backgroungColor = Color.pink
    
    var body: some View {
        ZStack {
            // background
            backgroungColor
                .ignoresSafeArea()
            
            //content
            contentLayer
        }
    }
    
    var contentLayer: some View {
        VStack {
            Text("Title".uppercased())
                .font(.largeTitle)
            
            Button(action: {
                buttonPressed()
            }, label: {
                Text("Press me")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding()
                    .background(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            })
        }
    }
    
    func buttonPressed() {
        backgroungColor = Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1))
    }
}

#Preview {
    ExtractedFunctions()
}

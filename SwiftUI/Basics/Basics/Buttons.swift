//
//  Buttons.swift
//  Basics
//
//  Created by Дарья Литвинова on 13.11.2025.
//

import SwiftUI

struct Buttons: View {
    @State var title: String = "This is my title"
    
    var body: some View {
        VStack(spacing: 20) {
            Text(title)
            
            Button("Press me!") {
                self.title = "Button #1 pressed!"
            }
            .tint(.red)
            
            Button(action: {
                self.title = "Button #2 pressed!"
            }, label: {
                Text("Press me too".uppercased())
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding()
                    .padding(.horizontal, 20)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 10)
            })
            
            Button(action: {
                self.title = "Button #3 pressed!"
            }, label: {
                Circle()
                    .fill(.white)
                    .frame(width: 75, height: 75)
                    .shadow(radius: 10)
                    .overlay(Image(systemName: "heart.fill")
                        .font(.largeTitle)
                        .foregroundStyle(Color(#colorLiteral(red: 1, green: 0.2923557162, blue: 0.5565357208, alpha: 1)))
            )
            })
            
            Button {
                self.title = "Button #4 pressed!"
            } label: {
                Text("And Me!")
                    .font(.caption)
                    .bold()
                    .foregroundStyle(.gray)
                    .padding()
                    .padding(.horizontal, 20)
                    .background(
                        Capsule()
                            .stroke(.gray, lineWidth: 2)
                    )
            }

        }
    }
}

#Preview {
    Buttons()
}

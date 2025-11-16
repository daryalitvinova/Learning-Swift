//
//  Backgrounds+Overlays.swift
//  Basics
//
//  Created by Дарья Литвинова on 10.11.2025.
//

import SwiftUI

struct Backgrounds_Overlays: View {
    var body: some View {
//        Circle()
//            .fill(Color.pink)
//            .frame(width: 100, height: 100)
//            .overlay(
//                Text("1")
//                    .font(.largeTitle)
//                    .foregroundStyle(.white)
//            )
//            //.frame(width: 120, height: 120) // выглядит также как и если спустить ниже
//            .background(
//                Circle()
//                    .fill(Color.purple)
//                    .frame(width: 120, height: 120)
//                    
//            )
//        Rectangle()
//            .frame(width: 100, height: 100)
//            .overlay(
//                Rectangle()
//                    .fill(Color.blue)
//                    .frame(width: 50, height: 50),
//                alignment: .topLeading
//            )
//            .background(
//                Rectangle()
//                    .fill(Color.red)
//                    .frame(width: 150, height: 150)
//                ,
//                alignment: .bottomTrailing
//            )
        Image(systemName: "heart.fill")
            .font(.system(size: 40))
            .foregroundStyle(Color.white)
            .background(
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing)
                    )
                    .frame(width: 100, height: 100)
                    .shadow(color: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 0.4963769826)), radius: 10, x: 0.0, y: 10.0)
                    .overlay(
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 35, height: 35)
                        .overlay(
                            Text("5")
                                .font(.headline)
                                .foregroundStyle(.white)
                        )
                        .shadow(color: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 0.4963769826)), radius: 10, x: 5.0, y: 5.0),
                        alignment: .bottomTrailing
                    )
            )
    }
}

#Preview {
    Backgrounds_Overlays()
}

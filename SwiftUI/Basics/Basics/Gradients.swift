//
//  Gradients.swift
//  Basics
//
//  Created by Дарья Литвинова on 07.11.2025.
//

import SwiftUI

struct Gradients: View {
    var body: some View {
        Capsule(style: .circular)
            .fill(
                //.indigo
//                LinearGradient(
//                    gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 0.2923557162, blue: 0.5565357208, alpha: 1)), Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)), Color(#colorLiteral(red: 0.9481598735, green: 0.7077434659, blue: 0.8095247149, alpha: 1))]),
//                    startPoint: .bottom,
//                    endPoint: .top)
//                RadialGradient(
//                    gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)), Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))]),
//                    center: .center,
//                    startRadius: 2,
//                    endRadius: 100)
                AngularGradient(
                    gradient: Gradient(colors:[Color(#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)), Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)), Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))]),
                    center: .center,
                    angle: .degrees(45))
            )
            .frame(width: 200, height: 400)
    }
}

#Preview {
    Gradients()
}

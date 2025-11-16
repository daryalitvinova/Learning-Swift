//
//  Icons.swift
//  Basics
//
//  Created by Дарья Литвинова on 09.11.2025.
//

import SwiftUI

struct Icons: View {
    var body: some View {
        Image(systemName: "lightbulb.max.fill")
            .resizable() // при этом размер подстраивается под фрейм
            //.aspectRatio(contentMode: .fill) // растягивает под фрейм узкую часть
            //.scaledToFill() // тоже самое что и aspectRatio fill
            //.aspectRatio(contentMode: .fit) // подстраивает под фрейм широкую часть
            .scaledToFit() // тоже самое что и aspectRatio fit
            //.font(.title)
            //.font(.system(size: 200))
            //.foregroundColor(.orange)
            .foregroundStyle(RadialGradient(
                gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)), Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1))]),
                center: .center,
                startRadius: 2,
                endRadius: 100))
            .frame(width: 300, height: 300) // задает рамку, сама иконка остается своего размера
            //.clipped() // обжезает под фрейм
    }
}

#Preview {
    Icons()
}

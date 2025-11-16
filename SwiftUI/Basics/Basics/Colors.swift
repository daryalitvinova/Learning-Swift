//
//  Colors.swift
//  Basics
//
//  Created by Дарья Литвинова on 06.11.2025.
//

import SwiftUI

struct Colors: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .fill(
                //.primary
                //Color(#colorLiteral(red: 1, green: 0.2923557162, blue: 0.5565357208, alpha: 1))
                //Color(UIColor.secondarySystemBackground) // из UIKit, что удобно, что вот такие цвета при смене темы меняются, этот например, будет светлосерый/темносерый
                .custom
            )
            .frame(width: 300, height: 200)
            .shadow(color: .gray.opacity(0.8), radius: 30, x: -30, y: -20)
    }
}

#Preview {
    Colors()
}

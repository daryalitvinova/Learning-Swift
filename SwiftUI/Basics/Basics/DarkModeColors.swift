//
//  DarkModeColors.swift
//  Basics
//
//  Created by Дарья Литвинова on 28.11.2025.
//

import SwiftUI

struct DarkModeColors: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Spacer()
            
            Text("This color is PRIMARY")
                .foregroundStyle(.primary)
            Text("This color is SECONDARY")
                .foregroundStyle(.secondary)
            Text("This color is BLACK")
                .foregroundStyle(.black)
            Text("This color is WHITE")
                .foregroundStyle(.white)
            Text("This color is PRIMARY")
                .foregroundStyle(.primary)
            Text("This color is globally adaptive")
                .foregroundStyle(.primary)
            Text("This color is locally adaptive")
                .foregroundStyle(colorScheme == .light ? .brown : .green)
            
            Spacer()
        }
    }
}

struct DarkModeColors_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DarkModeColors()
                .preferredColorScheme(.light)
            
            DarkModeColors()
                .preferredColorScheme(.dark)
        }
    }
}

//
//  AccessebilityColors.swift
//  ContinueLearning
//
//  Created by Дарья Литвинова on 14.02.2026.
//

import SwiftUI

// XCode -> Open Developer Tool -> Accessibility Inspector -> Window -> Show Color Conrasr Calculator - проверить цвета на достаточную контрастность

// в настройках есть Универсальный доступ -> Дисплей и размер текста, там есть разные возможности по настройке цвета, это все можно использовать для цветовой схемы приложения

struct AccessebilityColors: View {
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    @Environment(\.colorSchemeContrast) var colorSchemeContrast
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityInvertColors) var invertColors
    
    var body: some View {
        VStack {
            Button("Button 1") { }
                .foregroundStyle(colorSchemeContrast == .increased ? .white : .primary)
                .buttonStyle(.borderedProminent)
            
            Button("Button 2") { }
                .buttonStyle(.borderedProminent)
                .tint(.green)
                .foregroundStyle(.white)
            
            Button("Button 3") { }
                .buttonStyle(.borderedProminent)
                .tint(.orange)
                .foregroundStyle(.primary)
            
            Button("Button 4") { }
                .buttonStyle(.borderedProminent)
                .tint(differentiateWithoutColor ? .black : .purple)
                .foregroundStyle(differentiateWithoutColor ? .white : .green)
        }
        .font(.title)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .background(reduceTransparency ? .black : .black.opacity(0.5))
    }
}

#Preview {
    AccessebilityColors()
}

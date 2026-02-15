//
//  Masks.swift
//  ContinueLearning
//
//  Created by Дарья Литвинова on 27.01.2026.
//

import SwiftUI

struct Masks: View {
    @State private var selectedIndex: Int = 0
    
    var body: some View {
        ZStack {
            starsView
                .overlay(starsOverlay.mask(starsView))
        }
    }
    
    private var starsView: some View {
        HStack {
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundStyle(.gray)
                    .onTapGesture {
                        selectedIndex = index
                    }
            }
        }
    }
    
    private var starsOverlay: some View {
        ZStack {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .foregroundStyle(LinearGradient(gradient:
                                                            Gradient(colors: [.red, .yellow]),
                                                        startPoint: .leading,
                                                        endPoint: .trailing))
                        .frame(width: CGFloat(selectedIndex) / 5 * geometry.size.width)
                }
            }
        }
        // так как overlay перекрывает вью при нажатии на звезды, уменьшить их количество нельзя, так это вью не будет кликабельным
        .allowsHitTesting(false)
    }
}

#Preview {
    Masks()
}

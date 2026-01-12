//
//  AnimationCurves.swift
//  Basics
//
//  Created by Дарья Литвинова on 16.11.2025.
//

import SwiftUI

struct AnimationCurves: View {
    @State private var isAnimating: Bool = false
    private let timing: Double = 10.0
    
    var body: some View {
        VStack {
            Button("Animate") {
                isAnimating.toggle()
            }
            
            RoundedRectangle(cornerRadius: 10.0)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(Animation.linear(duration: timing), value: isAnimating)
            
            RoundedRectangle(cornerRadius: 10.0)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(Animation.easeIn(duration: timing), value: isAnimating)
            
            RoundedRectangle(cornerRadius: 10.0)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(Animation.easeOut(duration: timing), value: isAnimating)
            
            RoundedRectangle(cornerRadius: 10.0)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(Animation.easeInOut(duration: timing), value: isAnimating)
            
            RoundedRectangle(cornerRadius: 10.0)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(Animation.bouncy(duration: timing), value: isAnimating)
            
            RoundedRectangle(cornerRadius: 10.0)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(Animation.smooth(duration: timing), value: isAnimating)
            
            RoundedRectangle(cornerRadius: 10.0)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(
                    Animation.spring(response: 1.0, // задает время, за которое пружина достигает целевого значения
                                     dampingFraction: 0.5, // как сильно будет колебаться, 0 - сильно, 1 - вообще нет
                                     blendDuration: 1.0), // плавно смешивает эту анимацию с предыдущей, если есть, 0 - резкий переход, больше - мягче
                    value: isAnimating)
        }
    }
}

#Preview {
    AnimationCurves()
}

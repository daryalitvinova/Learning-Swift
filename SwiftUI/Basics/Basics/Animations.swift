//
//  Animations.swift
//  Basics
//
//  Created by Дарья Литвинова on 15.11.2025.
//

import SwiftUI

struct Animations: View {
    @State private var isAnimated = false
    // фаза анимации, нужен так как по сути isAnimated = вкл\выкл, а эта переменная покажет какое положение, цвет, и форма в данный момент - фаза
    @State private var animateOffset = false
    
    var body: some View {
//        VStack {
//            Button("Animate: \(isAnimated.description)") {
////                withAnimation(
////                    Animation
////                        .default
////                        //.delay(2.0)
////                        //.repeatCount(4, autoreverses: false)
////                        .repeatForever(autoreverses: true)
////                ){
////                    isAnimated.toggle()
////                }
//                isAnimated.toggle()
//            }
//            
//            Spacer()
//            
//            RoundedRectangle(cornerRadius: isAnimated ? 50 : 25)
//                .fill(isAnimated ? .blue : .pink)
//                .frame(width: isAnimated ? 100 : 300,
//                       height: isAnimated ? 100 : 300)
//                .rotationEffect(Angle(degrees: isAnimated ? 360 : 0))
//                .offset(y: isAnimated ? 300: 0)
//                // так получается несинхронно потому что на каждое свойство применяется отдельная анимация, и не гарантируется что они все запустятся одновременно, с одинаковой фазой и в офинаковых циклах
//                .animation(
//                    Animation
//                        .default
//                        //.delay(2.0)
//                        //.repeatCount(5, autoreverses: true)
//                        .repeatForever(autoreverses: true)
//                        , value: isAnimated)
//            
//            Spacer()
//        }
        
        VStack {
            Button("Animate: \(isAnimated.description)") {
                if isAnimated {
                    isAnimated = false
                    animateOffset = false
                } else {
                    isAnimated = true
                    startAnimationLoop()
                }
            }
            
            Spacer()
            
            RoundedRectangle(cornerRadius: animateOffset ? 50 : 25)
                .fill(animateOffset ? .blue : .pink)
                .frame(
                    width: animateOffset ? 100 : 300,
                    height: animateOffset ? 100 : 300)
                .rotationEffect(Angle(degrees: animateOffset ? 360 : 0))
                .offset(y: animateOffset ? 300: 0)
                .animation(.easeInOut(duration: 1.5), value: animateOffset)
            
            Spacer()
        }
    }
    
    private func startAnimationLoop() {
        // чтобы движение началось
        animateOffset.toggle()
        
        // запускаем бесконечный цикл
        Task {
            while isAnimated {
                try? await Task.sleep(for: .seconds(1.5))
                // чтобы движение продолжалось
                animateOffset.toggle()
            }
        }
    }
}

#Preview {
    Animations()
}

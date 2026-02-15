//
//  DragGestures.swift
//  ContinueLearning
//
//  Created by Дарья Литвинова on 24.01.2026.
//

import SwiftUI

struct DragGestures: View {
    @State private var offset: CGSize = .zero
    
    var body: some View {
        ZStack {
            VStack {
                Text("\(offset.width)")
                Spacer()
            }
            
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 250, height: 450)
                .offset(offset)
                .scaleEffect(getScaleAmount())
                .rotationEffect(Angle(degrees: getRotationAmount()))
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            offset = value.translation
                        })
                        .onEnded({ vaalue in
                            withAnimation(.spring) {
                                offset = .zero
                            }
                        })
                )
        }
    }
    
    private func getScaleAmount() -> CGFloat {
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = abs(offset.width)
        let percentage = currentAmount / max
        return 1.0 - min(percentage, 0.5) * 0.5
        
    }
    
    private func getRotationAmount() -> Double {
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = offset.width
        let percentage = Double(currentAmount / max)
        let maxAngle: Double = 10
        
        return percentage * maxAngle
    }
}

#Preview {
    DragGestures()
}

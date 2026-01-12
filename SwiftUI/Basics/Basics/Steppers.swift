//
//  Steppers.swift
//  Basics
//
//  Created by Дарья Литвинова on 21.11.2025.
//

import SwiftUI

struct Steppers: View {
    @State private var stepperValue: Int = 0
    @State private var widthIncrement: CGFloat = 0
    
    var body: some View {
        VStack {
            Stepper("Stepper: \(stepperValue)", value: $stepperValue)
            
            RoundedRectangle(cornerRadius: 20.0)
                .frame(width: 100 + widthIncrement, height: 100)
            
            Stepper("Width increment") {
                incrementWidth(value: 10)
            } onDecrement: {
                incrementWidth(value: -10)
            }
        }
        .padding(50)
    }
    
    private func incrementWidth(value: CGFloat) {
        withAnimation(.easeInOut) {
            widthIncrement += value
        }
    }
}

#Preview {
    Steppers()
}

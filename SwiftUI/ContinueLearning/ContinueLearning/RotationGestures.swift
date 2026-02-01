//
//  RotationGestures.swift
//  ContinueLearning
//
//  Created by Дарья Литвинова on 24.01.2026.
//

import SwiftUI

struct RotationGestures: View {
    @State private var angle = Angle(degrees: 0)
    
    var body: some View {
        Text("Hello, World!")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .padding(50)
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .rotationEffect(angle)
            .gesture(
                RotationGesture()
                    .onChanged { value in
                        angle = value
                    }
                    .onEnded { _ in
                        withAnimation(.spring) {
                            angle = Angle(degrees: 0)
                        }
                    }
            )
    }
}

#Preview {
    RotationGestures()
}

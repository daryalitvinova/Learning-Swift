//
//  Shapea.swift
//  Basics
//
//  Created by Дарья Литвинова on 06.11.2025.
//

import SwiftUI

struct Shapes: View {
    var body: some View {
        //Circle()
        //Ellipse()
        //Capsule(style: .continuous)
        RoundedRectangle(cornerRadius: 50)
            //.fill(.blue)
            //.foregroundStyle(.brown)
            //.stroke()
            //.stroke(.red, lineWidth: 7)
            .trim(from: 0.1, to: 0.7)
            .stroke(.orange, style: StrokeStyle(lineWidth: 7, lineCap: .round, dash: [10, 20, 30]))
            .frame(width: 300, height: 400)
    }
}

#Preview {
    Shapes()
}

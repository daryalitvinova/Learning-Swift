//
//  LocationMapAnnotation.swift
//  MappApp
//
//  Created by Дарья Литвинова on 19.01.2026.
//

import SwiftUI

struct LocationMapAnnotation: View {
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundStyle(.white)
                .padding(6)
                .background(.accent)
                .clipShape(Circle())
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.accent)
                .frame(width: 10, height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -3)
                // чтобы низ был как бы серединой и координата соответствовала нижней точке треугольника, потому что координата будет в середине этого вью
                .padding(.bottom, 40)
        }
    }
}

#Preview {
    LocationMapAnnotation()
}

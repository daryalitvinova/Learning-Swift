//
//  SystemMaterials.swift
//  Basics
//
//  Created by Дарья Литвинова on 07.12.2025.
//

import SwiftUI

struct SystemMaterials: View {
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 40, height: 4)
                    .padding()
                Text("thinMaterial")
                Spacer()
            }
            .frame(height: 100)
            .frame(maxWidth: .infinity)
            //.background(Color.black.opacity(0.5))
            .background(.thinMaterial)
            .cornerRadius(30)
            
            VStack {
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 40, height: 4)
                    .padding()
                Text("UltraThinMaterial")
                Spacer()
            }
            .frame(height: 100)
            .frame(maxWidth: .infinity)
            .background(.ultraThinMaterial)
            .cornerRadius(30)
            
            VStack {
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 40, height: 4)
                    .padding()
                Text("thickMaterial")
                Spacer()
            }
            .frame(height: 100)
            .frame(maxWidth: .infinity)
            .background(.thickMaterial)
            .cornerRadius(30)
            
            VStack {
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 40, height: 4)
                    .padding()
                Text("ultraThickMaterial")
                Spacer()
            }
            .frame(height: 100)
            .frame(maxWidth: .infinity)
            .background(.ultraThickMaterial)
            .cornerRadius(30)
            
            VStack {
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 40, height: 4)
                    .padding()
                Text("regularMaterial")
                Spacer()
            }
            .frame(height: 100)
            .frame(maxWidth: .infinity)
            .background(.regularMaterial)
            .cornerRadius(30)
        }
        .background(Image(.nature)
            .resizable()
            .scaledToFill())
        .ignoresSafeArea()
    }
}

#Preview {
    SystemMaterials()
}

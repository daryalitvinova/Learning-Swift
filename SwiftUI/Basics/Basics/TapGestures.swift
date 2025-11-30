//
//  TapGestures.swift
//  Basics
//
//  Created by Дарья Литвинова on 30.11.2025.
//

import SwiftUI

struct TapGestures: View {
    @State private var isSelected = false
    @State private var isLiked = false
    
    var body: some View {
        VStack(spacing: 20) {
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    //.frame(height: 200)
                    .foregroundStyle(isSelected ? .green : .pink)
                
                if isLiked {
                    Image(systemName: "heart.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.white)
                        .zIndex(2.0)
                }
            }
            .frame(height: 200)
            
            Button(action : {
                isSelected.toggle()
            }, label: {
                Text("Button")
                    .font(.headline)
                    .tint(.white)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
            })
            
            Text("Button")
                .font(.headline)
                .foregroundStyle(.white)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 25))
//                .onTapGesture {
//                    isSelected.toggle()
//                }
                .onTapGesture(count: 2) {
                    withAnimation(.easeInOut) {
                        isLiked.toggle()
                    }
                }
            
            Spacer()
                
        }
        .padding(40)
    }
}

#Preview {
    TapGestures()
}

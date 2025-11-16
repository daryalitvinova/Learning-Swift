//
//  VStack+HStack+ZStack.swift
//  Basics
//
//  Created by Дарья Литвинова on 10.11.2025.
//

import SwiftUI

struct VStack_HStack_ZStack: View {
    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .fill(.yellow)
                .frame(width: 350, height: 500)
            VStack(alignment: .leading, spacing: 25) {
                Rectangle()
                    .fill(.red)
                    .frame(width: 150, height: 150)
                Rectangle()
                    .fill(.green)
                    .frame(width: 100, height: 100)
                HStack(alignment: .bottom) {
                    Rectangle()
                        .fill(.purple)
                        .frame(width: 50, height: 50)
                    Rectangle()
                        .fill(.pink)
                        .frame(width: 75, height: 75)
                    Rectangle()
                        .fill(.blue)
                        .frame(width: 25, height: 25)
                }
                .background(.white)
            }
            .background(.black)
        }
        
        // Выглядит одинаково, но сделано по-разному
//        VStack(spacing: 50) {
//            ZStack {
//                Circle()
//                    .frame(width: 100, height: 100)
//                Text("1")
//                    .font(.title)
//                    .foregroundStyle(.white)
//            }
//            
//            Text("1")
//                .font(.title)
//                .foregroundStyle(.white)
//                .background(
//                    Circle()
//                        .frame(width: 100, height: 100)
//                )
//        }
    }
}

#Preview {
    VStack_HStack_ZStack()
}

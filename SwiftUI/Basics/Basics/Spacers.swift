//
//  Spacer.swift
//  Basics
//
//  Created by Дарья Литвинова on 10.11.2025.
//

import SwiftUI

struct Spacers: View {
    var body: some View {
        //        HStack {
        //            Spacer(minLength: 0)
        //                // обычно этого нет, но тут просто чтобы видеть, потому что ам по себе прозрачный
        //                .frame(height: 10)
        //                .background(.orange)
        //
        //            Rectangle()
        //                .foregroundStyle(.brown)
        //                .frame(width: 50, height: 50)
        //
        //            Spacer()
        //                .frame(height: 10)
        //                .background(.orange)
        //
        //            Rectangle()
        //                .foregroundStyle(.purple)
        //                .frame(width: 50, height: 50)
        //
        //            Spacer()
        //                .frame(height: 10)
        //                .background(.orange)
        //
        //            Rectangle()
        //                .foregroundStyle(.gray)
        //                .frame(width: 50, height: 50)
        //
        //            Spacer(minLength: 0)
        //                .frame(height: 10)
        //                .background(.orange)
        //        }
        //        .background(.green)
        //        // например, если паддинг будет слишком большой, видно, что какая-то ширина спейсера все равно остается, потому что есть минимальная длина, ее можно задать 0
        //        .padding(.horizontal, 200)
        VStack {
            HStack(spacing: 0) {
                Image(systemName: "xmark")
                
                Spacer()
                    .frame(height: 10)
                    .background(.orange)
                
                Image(systemName: "gear")
            }
            .font(.title)
            .background(.yellow)
            .padding(.horizontal)
            .background(.blue)
            
            // передвигаем вью выше наверх экрана с помощью этого
            Spacer()
                .frame(width: 10)
                .background(.orange)
            
            // а этот получится в самом низу
            Rectangle()
                .foregroundStyle(.gray)
                .frame(height: 50)
        }
    }
}

#Preview {
    Spacers()
}

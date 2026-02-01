//
//  MagnificationGestures.swift
//  ContinueLearning
//
//  Created by Дарья Литвинова on 23.01.2026.
//

import SwiftUI

struct MagnificationGestures: View {
    @State var currentAmount: CGFloat = 0
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Circle()
                    .frame(width: 40, height: 40)
                Text("MagnificationGestures")
                
                Spacer()
                
                Image(systemName: "ellipsis")
            }
            .padding(.horizontal)
            
            Rectangle()
                .frame(height: 300)
                // в целом, можно просто использовать currentAmount, но тогда могут быть скачки, не будет плавности при новом касании, и если нужно накопить масштаб тоже полезно
                .scaleEffect(1 + currentAmount)
                .gesture(
                    MagnificationGesture()
                        // value тут не дельта, это абсолютный коэффициент масштаба жеста относительно начала текущего, так что чтобы как раз получить дельту мы и отнимаем 1 как стардартный масштаб
                        .onChanged { value in
                            currentAmount = value - 1
                        }
                        .onEnded { value in
                            withAnimation(.spring()) {
                                currentAmount = 0
                            }
                        }
                )
            
            HStack {
                Image(systemName: "heart.fill")
                Image(systemName: "text.bubble.fill")
                Spacer()
            }
            .padding(.horizontal)
            .font(.title3)
            
            Text("Подпись к фото")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
        }
    }
}

#Preview {
    MagnificationGestures()
}

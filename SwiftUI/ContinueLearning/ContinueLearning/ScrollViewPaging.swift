//
//  ScrollViewPaging.swift
//  ContinueLearning
//
//  Created by Дарья Литвинова on 15.02.2026.
//

import SwiftUI

struct ScrollViewPaging: View {
    @State private var scrollPosition: Int? = nil
    
    var body: some View {
        Button("Scroll to") {
            scrollPosition = (0..<20).randomElement()
        }
        ScrollView(.horizontal) {
            HStack(spacing: 0) {
                ForEach(0..<20) { index in
                    Rectangle()
                    // из-за вот этого все равно будет сдвиг, вынесем на уровень скролл вью
                    //    .ignoresSafeArea()
                        .frame(width: 300, height: 300)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .overlay(
                            Text("\(index)").foregroundStyle(.white)
                        )
                        .frame(maxWidth: .infinity)
                    // чтобы не было этих сдвигов добавим паддинг здесь
                        .padding(10)
                        .id(index)
                    // можно определить как будут выглядеть элементы, которые уже показаны на эране, но еще не полностью, в общем то как будет выглядеть переход
                        .scrollTransition(.interactive.threshold(.visible(0.5))) { content, phase in
                    //    .scrollTransition(/*.identity*/.animated) { content, phase in
                            content
                            // isIdentity = true - на экране
                                .opacity(phase.isIdentity ? 1 : 0)
                                .offset(y: phase.isIdentity ? 0 : -100)
                        }
                }
                .padding(.vertical, 100)
            }
        }
        .ignoresSafeArea()
        .scrollTargetLayout()
        // если скролл остановили на середине вью, то само выровняется по началу ближайшего начала вью
        .scrollTargetBehavior(.viewAligned)
        // отскок от края экрана
        .scrollBounceBehavior(.basedOnSize)
        .scrollPosition(id: $scrollPosition, anchor: .center)
        .animation(.smooth, value: scrollPosition)
    }
    
//    ScrollView {
//        VStack(spacing: 0) {
//            ForEach(0..<20) { index in
//                Rectangle()
//                // из-за вот этого все равно будет сдвиг, вынесем на уровень скролл вью
//                //    .ignoresSafeArea()
//                //.frame(width: 300, height: 300)
//                    .overlay(
//                        Text("\(index)").foregroundStyle(.white)
//                    )
//                    .frame(maxWidth: .infinity)
//                // чтобы не было этих сдвигов добавим паддинг здесь
//                //    .padding(.vertical, 10)
//                // 1 вью на экран (посередине), но из-за того что есть spacing они будут как бы сдвигаться вних по мере свайпов
//                    .containerRelativeFrame(.vertical, alignment: .center)
//            }
//        }
//    }
//    .ignoresSafeArea()
//    .scrollTargetLayout()
//    // если скролл остановили на середине вью, то само выровняется по началу ближайшего начала вью
//    //.scrollTargetBehavior(.viewAligned)
//    .scrollTargetBehavior(.paging)
//    // отскок от края экрана
//    //.scrollBounceBehavior(.always)
//    .scrollBounceBehavior(.basedOnSize)
}

#Preview {
    ScrollViewPaging()
}

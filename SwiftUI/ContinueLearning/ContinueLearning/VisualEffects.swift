//
//  VisualEffects.swift
//  ContinueLearning
//
//  Created by Дарья Литвинова on 15.02.2026.
//

import SwiftUI

struct VisualEffects: View {
    @State private var showSpacer: Bool = false
    
    var body: some View {
        // по умолчанию имеет размер всего экрана, если не укажем какие-то границы
        //        GeometryReader(content: { geometry in
        //            Text("Hello, World!")
        //                .padding()
        //                .background(.red)
        //                //.grayscale(0)
        //        })
        //        .background(.green)
        //        //.frame(width: 100)
        //        .padding()
        
//        VStack {
//            Text("Hello, World! kfjdsklfjsldfjlsk;djfkldsjfsd;fjdslfjdslk")
//                .padding()
//                .background(.red)
//            // альтернатива GeometryReader
//                .visualEffect { content, geometry in
//                    // это не вью, это тип VisualEffect, к нему применяются большинство modifiers, которые применяются к GeometryReader
//                    content
//                    //.grayscale(geometry.size.width >= 200 ? 1 : 0)
//                        .grayscale(geometry.frame(in: .global).minY < 300 ? 1 : 0)
//                }
//            
//            if showSpacer {
//                Spacer()
//            }
//        }
//        .animation(.easeIn, value: showSpacer)
//        .onTapGesture {
//            showSpacer.toggle()
//        }
        
        ScrollView {
            ForEach(0..<100) { index in
                Rectangle()
                    .frame(width: 300, height: 200)
                    .frame(maxWidth: .infinity)
                    .background(.orange)
                    .visualEffect { content, geometry in
                        content
                        // по мере того как пролистываешь сразу перерисовывается, создается эффект анимации, minY уменьшается, и прямоуголиники плавно сдвигаются к левому краю экрана
                            .offset(x: geometry.frame(in: .global).minY * 0.05)
                    }
            }
        }
    }
}

#Preview {
    VisualEffects()
}

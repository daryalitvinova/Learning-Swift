//
//  AlignmentGuidee.swift
//  ContinueLearning
//
//  Created by Дарья Литвинова on 14.02.2026.
//

import SwiftUI

// тут все супер подробно
// https://swiftui-lab.com/alignment-guides/

struct AlignmentGuidee: View {
    var body: some View {
        VStack(alignment: .leading) {
        //VStack(alignment: .center) { // в таком варианте ничего никуда не сдвигается
            Text("Hello")
                .background(.blue)
            // тк мы сдвигаем только сам текст, стек остался на месте
            //    .offset(x: 20)
            // а так сдвигаем сам стек
                .alignmentGuide(.leading) { dimentions in
                    //20
                    dimentions.width // сдвигаем на ширину стека, без этого бы пришлось использовать GeometryReader, чтобы понять насколько надо сдвигать
                }
            
            Text("This is some other text")
                .background(.red)
        }
        .background(.orange)
    }
}

struct AlignmentChildView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            row(title: "Row 1", showIcon: false)
            row(title: "Row 2", showIcon: true)
            row(title: "Row 3", showIcon: false)
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(radius: 10)
        .padding(40)
    }
    
    private func row(title: String, showIcon: Bool) -> some View {
        // просто так некрасиво съезжает без Image нет выравнивания
        HStack(spacing: 10) {
            /* можно такой вариант
            Image(systemName: "info.circle")
                .opacity(showIcon ? 1 : 0)
             */
            if showIcon {
                Image(systemName: "info.circle")
                    .frame(width: 30, height: 30)
            }
            
            Text(title)
                    .background(.red)
            Spacer()
        }
        .alignmentGuide(.leading) { dimentions in
            return showIcon ? 40 : 0 // 40 = spacing + width
        }
    }
}

#Preview {
    AlignmentChildView()
}

//
//  Images.swift
//  Basics
//
//  Created by Дарья Литвинова on 09.11.2025.
//

import SwiftUI

struct Images: View {
    var body: some View {
        //Image(.nature)
           // .resizable()
            //.scaledToFill()
            //.scaledToFit()
         //   .frame(width: 300, height: 200)
            
            //.clipped()
            //.cornerRadius(50)
        
//            .clipShape(
//                //Circle()
//                //RoundedRectangle(cornerRadius: 50)
//                Ellipse()
//            )
        
        Image(.google)
        //.renderingMode(.template) // если бы не было прозрачного фона все бы закрасилось; это можно настрить в ассетах в самом изображении сразу
            .resizable()
            .scaledToFit()
            .frame(width: 300, height: 200)
            .foregroundStyle(.blue) // не работает без renderingMode
    }
}

#Preview {
    Images()
}

//
//  ViewThatFitss.swift
//  Basics
//
//  Created by Дарья Литвинова on 14.12.2025.
//

import SwiftUI

struct ViewThatFitss: View {
    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea()
            
            // В порядке очереди выбирается 1 вью, которое влезет на экран
            ViewThatFits/*(in: .horizontal)*/ {
                Text("This is some text that I would like to display to the user!")
                Text("This is some text that I would like to display!")
                Text("This is some text!")
            }
        }
        .frame(height: 300)
        .font(.headline)
        .padding(20)
        //.padding(50)
    }
}

#Preview {
    ViewThatFitss()
}

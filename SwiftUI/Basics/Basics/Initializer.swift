//
//  Initializer.swift
//  Basics
//
//  Created by Дарья Литвинова on 11.11.2025.
//

import SwiftUI

struct Initializer: View {
    
    let backgroundColor: Color
    let count: Int
    let title: String
    
    //    Вот это по умолчанию
    //    init(backgroundColor: Color, count: Int, title: String) {
    //        self.backgroundColor = backgroundColor
    //        self.count = count
    //        self.title = title
    //    }
    enum Fruit {
        case apple
        case orange
    }
    
    init(count: Int, fruit: Fruit) {
        self.count = count
//        if fruit == .apple {
//            self.backgroundColor = .red
//            self.title = "Apples"
//        } else {
//            self.backgroundColor = .orange
//            self.title = "Oranges"
//        }
        switch fruit {
        case .apple:
            self.backgroundColor = .red
            self.title = "Apples"
        case .orange:
            self.backgroundColor = .orange
            self.title = "Oranges"
        }
    }
    
    var body: some View {
        VStack(spacing: 12) {
            Text("\(count)")
                .font(.largeTitle)
                .foregroundStyle(.white)
                .underline()
            
            Text(title)
                .font(.headline)
                .foregroundStyle(.white)
        }
        .frame(width: 150, height: 150)
        .background(backgroundColor)
        .cornerRadius(10)
    }
}

#Preview {
    HStack {
        Initializer(count: 7, fruit: .orange)
        Initializer(count: 20, fruit: .apple)
    }
}

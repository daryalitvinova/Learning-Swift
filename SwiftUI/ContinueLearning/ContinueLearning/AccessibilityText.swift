//
//  AccessibilityText.swift
//  ContinueLearning
//
//  Created by Дарья Литвинова on 11.02.2026.
//

import SwiftUI

// Dynamic text


// можно менять шрифт на телефоне, и есть предопределенные варианты, и если будет установлен слишком большой или маленький выглядеть это все может страшно, это нужно учитывать и проверять
// (в превью можно посмотреть как будут выглядеть все варианты - dynamic types variants)

struct AccessibilityText: View {
    var body: some View {
        @Environment(\.dynamicTypeSize) var dynamicTypeSize
        
        NavigationStack {
            List {
                ForEach(0..<10) { _ in
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            // например это сердечко - кнопка, имаге тоже масштабируется, но фрейм кнопки останется прежним
                            Image(systemName: "heart.fill")
                            // а так не будет меняться, это можно применять и к тексту в том числе, и он всегда будет одного размера
                                .font(.system(size: 30))
                            Text("Welcome to my app")
                                .truncationMode(.tail)
                        }
                        .font(.title)
                        Text("This is some longer text than expands to multiple lines")
                            .font(.footnote)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            //.truncationMode(.head)
                            .lineLimit(2)
                        // насколько можно уменьшить текст, чтобы он поместился в нужный фрейм
                            .minimumScaleFactor(dynamicTypeSize.customScaleFactor)
                    }
                    //.frame(height: 100)
                    .background(.red)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Hello world!")
        }
    }
}

extension DynamicTypeSize {
    var customScaleFactor: CGFloat {
        switch self {
            
        case .xSmall, .small, .medium:
            return 1.0
        case .large, .xLarge, .xxLarge:
            return 0.8
        default:
            return 0.6
        }
    }
}

#Preview {
    AccessibilityText()
}

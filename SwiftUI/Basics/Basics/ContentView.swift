//
//  ContentView.swift
//  Text
//
//  Created by Дарья Литвинова on 06.11.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.black)
            Text("hello, world!sjdkasjdklsjldk".capitalized)
                //.font(.title)
                //.fontWeight(.semibold)
                //.fontDesign(.monospaced)
                //.bold()
                //.underline(pattern: .dashDot, color: .brown)
                //.italic()
                //.strikethrough()
                .font(.system(size: 24, weight: .medium, design: .monospaced))
                //.multilineTextAlignment(.leading) // очевидно работает только в многострочном тексте
                .baselineOffset(20.0) // с минусом будет перед строкой
                //.padding(.horizontal, 10.0)
                //.padding(.bottom, 30.0)
                //.kerning(10.0)
                .foregroundStyle(.cyan)
                .frame(width: 200, height: 100, alignment: .leading) // alignment в том числе и для однострочного
                //.minimumScaleFactor(0.5) //если текст не помещается по ширине, SwiftUI может уменьшить размер шрифта, но не меньше чем font * minimumScaleFactor
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

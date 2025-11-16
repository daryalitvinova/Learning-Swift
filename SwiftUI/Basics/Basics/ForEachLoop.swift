//
//  ForEachLoop.swift
//  Basics
//
//  Created by Дарья Литвинова on 11.11.2025.
//

import SwiftUI

struct ForEachLoop: View {
    //SwiftUI — это декларативный DSL, где тело View (var body: some View) должно быть строго определено на этапе компиляции.
    //data хоть и объявлено как let, но его значение вычисляется во время выполнения, а не на этапе компиляции.
    let data: [String] = ["Hi", "Hello", "Hey everyone"]
    var body: some View {
        VStack {
            //SwiftUI требует уникальные id для динамических коллекций, чтобы понимать, какие представления добавлять/удалять при изменении данных.
            //data.indices — вычисляемое свойство, а не compile-time range,поэтому без id: SwiftUI не знает, как “сопоставить” старые и новые элементы.
            ForEach(data.indices, id: \.self) { index in
                HStack {
                    Circle()
                        .frame(width: 30, height: 30)
                    Text("\(data[index]): \(index)")
                }
                
            }
            ForEach(0..<5) { index in
                HStack {
                    Circle()
                        .frame(width: 30, height: 30)
                    Text("Index is: \(index)")
                }
                
            }
        }
    }
}

#Preview {
    ForEachLoop()
}

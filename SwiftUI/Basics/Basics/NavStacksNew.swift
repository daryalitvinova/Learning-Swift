//
//  NavStacksNew.swift
//  Basics
//
//  Created by Дарья Литвинова on 08.12.2025.
//

import SwiftUI

struct NavStacksNew: View {
    
    private var fruits = ["Apple", "Orange", "Cherry"]
    @State private var stackPath: [String] = []
    
    // some View скрывает тип, но он не может меняться
    /* Так нельзя!!!
     if condition {
             Text("A")
         } else {
             Image("B") // error — разные типы
         }
     */
    var body: some View {
        // тут по сути если меняем NavigationView -> NavigationStack все внутри продолжает работать
        // path - текущий маршрут
        // после добавление path, перестал рабоать переход к экранам с Int, это так и работает, потому что $stackPath со String
        NavigationStack(path: $stackPath) {
            ScrollView {
                VStack(spacing: 20) {
                    // сразу по стеку навигации уходим на Banana, автоматичеки показывается экран, привязанный к этому значению, а потом уже можем возвращаться по одному
                    Button("Super seque!") {
                        stackPath.append(contentsOf: ["Coconut", "Watermelon", "Banana"])
                    }
                    
                    // так уже не будет работать переход
                    ForEach(fruits, id: \.self) { fruit in
                        NavigationLink(value: fruits) {
                            Text(fruit)
                        }
                    }
                    
                    ForEach(1..<10) { x in
                        // В таком виде все экраны NavigationLink сразу иницализируется, это был недостаток такого варианта с NavigationView
                        /*NavigationLink(
                            destination: {
                                MySecondScreen(value: x)
                            },
                            label: {
                                Text("Click me \(x)")
                            })*/
                        // Вот в таком виде с navigationDestination инициализируются только при самом переходе на нужный экран
                        NavigationLink(value: x) {
                            Text("Click me \(x)")
                        }
                    }
                    
                    // тут надо id, fruits не Hashable
                    ForEach(fruits, id: \.self) { x in
                        NavigationLink(value: x) {
                            Text("Click me \(x)")
                        }
                    }
                }
            }
            .navigationTitle("Navigation Stack")
            .navigationDestination(for: Int.self) { value in
                MySecondScreen(value: value)
            }
            .navigationDestination(for: String.self) { value in
                Text("ANOTHER SCREEN: \(value)")
            }
        }
    }
}

struct MySecondScreen: View {
    let value: Int
    
    init(value: Int) {
        self.value = value
        print("INIT SCREEN: \(value)")
    }
    
    var body: some View {
        Text("Screen \(value)")
    }
}

#Preview {
    NavStacksNew()
}

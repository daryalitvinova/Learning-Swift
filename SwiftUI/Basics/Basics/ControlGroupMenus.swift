//
//  ControlGroupMenus.swift
//  Basics
//
//  Created by Дарья Литвинова on 15.12.2025.
//

import SwiftUI

struct ControlGroupMenus: View {
    var body: some View {
        // вывод такой : все во все можно вкладывать
        Menu("My menu") {
            ControlGroup("One") {
                Button("Один") { }
                Button("Два") { }
                Menu("How are you?") {
                    Button("Good") { }
                    Button("Bad") { }
                }
            }
            Button("two") { }
            Menu("Three") {
                Button("Hi") { }
                Button("Hello") { }
            }
        }
    }
}

#Preview {
    ControlGroupMenus()
}

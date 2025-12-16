//
//  Menus.swift
//  Basics
//
//  Created by Дарья Литвинова on 12.12.2025.
//

import SwiftUI

struct Menus: View {
    var body: some View {
        Menu("Menu") {
            Button("First") {}
            Button("Second") {}
            Button("Third") {}
            Button("Forth") {}
        }
    }
}

#Preview {
    Menus()
}

//
//  TodoListApp.swift
//  TodoList
//
//  Created by Дарья Литвинова on 16.12.2025.
//

import SwiftUI

@main
struct TodoListApp: App {
    @StateObject var listViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            // у NavigationView для ipad нужно было еще сделать .navigaitonViewStyle, иначе вью для отсуствия итемов показывалось только при нажатии боковое меню
            NavigationStack {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}

//
//  Badges.swift
//  Basics
//
//  Created by Дарья Литвинова on 07.12.2025.
//

import SwiftUI

struct Badges: View {
    var body: some View {
//        TabView {
//            Color.orange
//                .tabItem {
//                    Image(systemName: "heart.fill")
//                    Text("Hello")
//                }
//                .badge("NEW")
//            
//            Color.yellow
//                .tabItem {
//                    Image(systemName: "heart.fill")
//                    Text("Hello")
//                }
//                .badge(5)
//                
//            Color.pink
//                .tabItem {
//                    Image(systemName: "heart.fill")
//                    Text("Hello")
//                }
//                .badge(0)
//        }
        
        List {
            Text("Hello")
                .badge("NEW")
            Text("Hello")
                .badge(5)
            Text("Hello")
                .badge(0)
            Text("Hello")
        }
    }
}

#Preview {
    Badges()
}

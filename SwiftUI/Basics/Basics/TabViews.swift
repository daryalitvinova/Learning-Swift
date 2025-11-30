//
//  TableViews.swift
//  Basics
//
//  Created by Дарья Литвинова on 21.11.2025.
//

import SwiftUI

struct TabViews: View {
    @State var selectedTab: Int = 0
    
    let icons: [String] = ["heart.fill", "globe", "house.fill", "person.fill"]
    
    var body: some View {
//        TabView(selection: $selectedTab) {
//            Tab(value: 0) {
//                HomeView(selectedTab: $selectedTab)
//            } label: {
//                Image(systemName: "house.fill")
//                Text("Home")
//            }
//
//            Tab(value: 1) {
//                Text("BROWSE TAB")
//            } label: {
//                Image(systemName: "globe")
//                Text("Browse")
//            }
//
//            Tab(value: 2) {
//                Text("PROFILE TAB")
//            } label: {
//                Image(systemName: "person.fill")
//                Text("Profile")
//            }
//        }
        TabView {
            ForEach(icons, id: \.self) { icon in
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .padding(50)
            }
        }
        .background(RadialGradient(colors: [.pink, .pink.opacity(0.2)], center: .center, startRadius: 5.0, endRadius: 300.0))
        .frame(height: 300)
        .tabViewStyle(PageTabViewStyle())
    }
}

struct HomeView: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        ZStack {
            Color.pink.ignoresSafeArea()
            
            VStack {
                Text("Home Tab")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                Button {
                    selectedTab = 2
                } label: {
                    Text("Go to Profile")
                        .font(.headline)
                        .foregroundStyle(.black)
                        .padding()
                        .padding(.horizontal)
                }
                .buttonStyle(.bordered)
                .tint(.white)

            }
        }
    }
}

#Preview {
    TabViews()
}

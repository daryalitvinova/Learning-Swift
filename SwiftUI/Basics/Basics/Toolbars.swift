//
//  Toolbars.swift
//  Basics
//
//  Created by Дарья Литвинова on 10.12.2025.
//

import SwiftUI

struct Toolbars: View {
    @State private var text: String = ""
    @State private var paths: [String] = []
    
    var body: some View {
        NavigationStack(path: $paths) {
            ZStack {
                Color.indigo.ignoresSafeArea()
                ScrollView {
                    VStack {
                        TextField("Some text", text: $text)
                        Text("Hey")
                            .foregroundStyle(.white)
                        
                    }
                    
                    ForEach(0..<20) { _ in
                        Rectangle()
                            .fill(.blue)
                            .frame(width: 200, height: 200)
                    }
                }
            }
            .navigationTitle("Toolbar")
//            .navigationBarItems(
//                leading: Image(systemName: "heart.fill"),
//                trailing: Image(systemName: "gear"))
            .toolbar() {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "heart.fill")
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "gear")
                }
                
                ToolbarItem(placement: .keyboard) {
                    Image(systemName: "microphone.fill")
                }
                /*ToolbarItem(placement: .principal) {
                    Image(systemName: "person")
                }*/
                ToolbarItem(placement: .automatic) {
                    Image(systemName: "house.fill")
                }
                
            }
            //.navigationBarHidden(true)
            //.toolbar(.hidden)
            //.toolbarBackground(.hidden, for: .navigationBar)
            //.toolbarColorScheme(.dark, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarTitleMenu {
                Button("Screen 1") {
                    paths.append("Screen 1")
                }
                Button("Screen 2") {
                    paths.append("Screen 2")
                }
            }
            .navigationDestination(for: String.self) { value in
                Text("New screen: \(value)")
            }
        }
    }
}

#Preview {
    Toolbars()
}

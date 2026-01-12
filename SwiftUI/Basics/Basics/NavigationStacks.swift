//
//  NavigationStack.swift
//  Basics
//
//  Created by Дарья Литвинова on 18.11.2025.
//

import SwiftUI

struct NavigationStacks: View {
    //@State private var path: [Route] = []
    
    var body: some View {
        NavigationStack {
            ScrollView {
                NavigationLink("Hello, World!",
                               destination: MyOtherScreen())
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
            }
            .navigationTitle(Text("All Inboxes"))
            //.navigationBarTitleDisplayMode(.automatic)
            //.toolbar(.hidden)
            .toolbar {
                ToolbarItem(
                    placement: .topBarLeading,
                    content: {
                        HStack {
                            Image(systemName: "person.fill")
                            Image(systemName: "flame.fill")
                                .foregroundStyle(.orange)
                        }
                    })
                
                ToolbarItem(
                    placement: .topBarTrailing,
                    content: {
                        NavigationLink(
                        destination: MyOtherScreen(),
                        label: {
                            Image(systemName: "gear")
                        })
                        .foregroundStyle(.red)
                    })
            }
        }
    }
}

struct MyOtherScreen: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color.green.edgesIgnoringSafeArea(.all)
                .navigationTitle("Green screen!")
                .toolbar(.hidden)
            
            VStack {
                Button("Back") {
                    dismiss()
                }
                
                NavigationLink("Click here!", destination: Text("Third screen"))
                
            }
        }
    }
}

#Preview {
    NavigationStacks()
    //MyOtherScreen()
}

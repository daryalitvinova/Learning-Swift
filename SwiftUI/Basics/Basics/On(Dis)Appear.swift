//
//  On(Dis)Appear.swift
//  Basics
//
//  Created by Дарья Литвинова on 30.11.2025.
//

import SwiftUI

struct On_Dis_Appear: View {
    @State private var myText: String = "Initial text"
    @State private var count: Int = 0
    
    var body: some View {
        NavigationView {
            ScrollView {
                Text(myText)
                
                LazyVStack {
                    ForEach(0..<50) { _ in
                        RoundedRectangle(cornerRadius: 25.0)
                            .frame(height: 200)
                            .padding()
                        // Счетчик меняется пока сколлим
                            .onAppear {
                                count += 1
                            }
                            .onDisappear {
                                count -= 1
                            }
                    }
                }
            }
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
                    myText = "This is the new text"
                })
            })
            // это мы не увидим, полезно, если нужно сделать что-то после исчезновения экрана, что-нибудь почистить
            .onDisappear(perform: {
                myText = "Ending text"
            })
            .navigationTitle("On appear: \(count)")
            
        }
    }
}

#Preview {
    On_Dis_Appear()
}

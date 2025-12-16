//
//  ResizableSheets.swift
//  Basics
//
//  Created by Дарья Литвинова on 11.12.2025.
//

import SwiftUI

struct ResizableSheets: View {
    
    @State private var showSheet: Bool = false
    @State private var detents: PresentationDetent = .large
    
    var body: some View {
        Button("Click me!") {
            showSheet.toggle()
        }
        .sheet(isPresented: $showSheet) {
            NextView(detents: $detents)
                // пользователь может менять размер на 1 из двух
                //.presentationDetents([.medium, .large])
                //.presentationDetents([.fraction(0.1), .height(300)])
                .presentationDetents([.medium, .fraction(0.3)], selection: $detents)
            
                .presentationDragIndicator(.hidden)
                // запрещаем пользователю убирать, например, до какого-то действия
                .interactiveDismissDisabled()
            
        }
    }
}

struct NextView: View {
    @Binding var detents: PresentationDetent
    
    var body: some View {
        ZStack {
            Color.orange
            
            VStack(spacing: 20) {
                Button("Medium") {
                    detents = .medium
                }
                // не будет работать, так как выше нет такого варианта в сете
                Button("Large") {
                    detents = .large
                }
            }
        }
    }
}

#Preview {
    ResizableSheets()
}

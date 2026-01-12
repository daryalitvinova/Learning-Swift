//
//  Sheets.swift
//  Basics
//
//  Created by Дарья Литвинова on 17.11.2025.
//

import SwiftUI

struct Sheets: View {
    @State private var showSheet = false
    
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            
            Button("Show sheet") {
                showSheet.toggle()
            }
            .foregroundStyle(.green)
            .font(.headline)
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        
        // может быть только один на экране
//        .sheet(isPresented: $showSheet) {
//            SecondScreen()
//        }
        
        .fullScreenCover(isPresented: $showSheet) {
            SecondScreen()
        }
    }
}

struct SecondScreen: View {
    
    //property wrapper, который позволяет доступ к системным или глобальным значениям среды внутри текущего представления (View)
    // \. - указывает ключ среды
    // \.dismiss - ключ, который дает функцию закрытия текущего представления
    // dismiss - имя переменной, тип которой выводится сам как () -> Void, которую можно вызвать для закрытия окна
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.red
                .ignoresSafeArea()
            
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .foregroundStyle(.white)
                    .font(.title)
                    .padding(20)
            }
        }
    }
}

#Preview {
    Sheets()
    //SecondScreen()
}

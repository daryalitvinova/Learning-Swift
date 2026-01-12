//
//  EnvironmentObjects.swift
//  Basics
//
//  Created by Дарья Литвинова on 02.12.2025.
//

import SwiftUI
internal import Combine

class EnvironmentViewModel: ObservableObject {
    @Published var dataArray: [String] = []
    
    init() {
        dataArray.append(contentsOf: ["iPhone", "iMac", "iPad", "Watch"])
    }
}

struct EnvironmentObjects: View {
    @StateObject var viewModel = EnvironmentViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.dataArray, id: \.self) { item in
                    NavigationLink(
                        destination: SecondView(selectedItem: item),
                        label: {
                            Text(item)
                        })
                }
            }
            .navigationTitle("Apple Devices")
        }
        // глобальный способ передавать данные по иерархии вью без явных параметров
        .environmentObject(viewModel)
    }
}

struct SecondView: View {
    
    let selectedItem: String
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.orange.ignoresSafeArea()
                
                NavigationLink(destination: FinalView(), label: {
                    Text(selectedItem)
                        .font(.largeTitle)
                        .padding()
                        .padding(.horizontal)
                        .background(.white)
                        .foregroundStyle(.orange)
                        .clipShape(Capsule())
                })
            }
        }
    }
}

struct FinalView: View {
    // объект сам найдется в окружении, не надо передавать вьюмодель через кучу уровней навигации
    @EnvironmentObject var viewModel: EnvironmentViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)),Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
                
            ScrollView {
                ForEach(viewModel.dataArray, id: \.self) { item in
                    Text(item)
                }
            }
        }
    }
}

#Preview {
    EnvironmentObjects()
    //SecondView(selectedItem: "iPhone")
}

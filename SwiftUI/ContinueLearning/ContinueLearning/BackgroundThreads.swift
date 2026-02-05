//
//  BackgroundThreads.swift
//  ContinueLearning
//
//  Created by Дарья Литвинова on 04.02.2026.
//

import SwiftUI
import Combine

class BackgroundThreadViewModel: ObservableObject {
    @Published var data: [String] = []
    
    func fetchData() {
        // все выполняется на главном потоке
//        let newData = downloadData()
//        data = newData
        
//        DispatchQueue.global().async {
//            let newData = self.downloadData()
//            // нельзя из бекграунда в главный поток "Publishing" изменения
//            self.data = newData
//        }
        
//        DispatchQueue.global().async {
//            let newData = self.downloadData()
//            
//            DispatchQueue.main.async {
//                self.data = newData
//            }
//        }
        DispatchQueue.global(qos: .background).async {
            let newData = self.downloadData()
            
            print("CHECK 1: \(Thread.isMainThread)")
            print("CHECK 2: \(Thread.current)")
            
            DispatchQueue.main.async {
                self.data = newData
                print("CHECK 1: \(Thread.isMainThread)")
                print("CHECK 2: \(Thread.current)")
            }
        }
    }
    
    private func downloadData() -> [String] {
        var data: [String] = []
        for x in 0..<100 {
            data.append("\(x)")
            print(data)
        }
        return data
    }
}

struct BackgroundThreads: View {
    @StateObject var viewModel = BackgroundThreadViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack {
                Text("LOAD DATA")
                    .font(.title)
                    .fontWeight(.bold)
                    .onTapGesture {
                        viewModel.fetchData()
                    }
                ForEach(viewModel.data, id: \.self) { item in
                    Text(item)
                        .font(.headline)
                        .foregroundStyle(.red)
                }
            }
        }
    }
}

#Preview {
    BackgroundThreads()
}

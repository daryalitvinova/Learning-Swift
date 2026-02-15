//
//  WeakSelfReferences.swift
//  ContinueLearning
//
//  Created by Дарья Литвинова on 04.02.2026.
//

import SwiftUI
import Combine

struct WeakSelfReferences: View {
    
    @AppStorage("count") var count: Int?
    
    init() {
        count = 0
    }
    
    var body: some View {
        NavigationStack {
            NavigationLink("Navifate") {
                SecondScreen()
            }
            .navigationTitle("Screen 1")
        }
        .overlay(
            Text("\(count ?? 0)")
                .font(.largeTitle)
                .padding()
                .background(.green)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            , alignment: .topTrailing)
    }
}

class WeakSelfSecondScreenViewModel: ObservableObject {
    @Published var data: String? = nil
    
    init() {
        print("INITIALIZE NOW")
        let currentValue = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentValue + 1, forKey: "count")
        getData()
    }
    
    deinit {
        print("DEIINITIALIZE NOW")
        let currentValue = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentValue - 1, forKey: "count")
    }
    
    private func getData() {
        // так все нормально
        //data = "NEW DATA!!!"
        
        // а если сделаем так, то deinit y будет срабатывать так как будет сильная ссылка на класс WeakSelfSecondScreenViewModel, и объект ДОЛЖЕН существовать в момент, когда к data будет присвоено значение
        // счетчик count будет расти
//        DispatchQueue.main.asyncAfter(deadline: .now() + 15) {
//            // как только это действие произойдет объект удалется, по крайней мере в этом примеере
//            self.data = "NEW DATA!!!"
//        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 15) { [weak self] in
            // если к этому моменту объекта не существует, то и ладно, не будем выполнять что там дальше, объект не обязан существовать
            // замыкание будет вызвано в любом случае независимо от жизни объекта
            self?.data = "NEW DATA!!!"
        }
        
    }
}

struct SecondScreen: View {
    @StateObject var viewModel = WeakSelfSecondScreenViewModel()
    var body: some View {
        Text("Second screen")
            .font(.largeTitle)
            .foregroundStyle(.red)
        
        if let data = viewModel.data {
            Text(data)
        }
    }
}

#Preview {
    WeakSelfReferences()
}

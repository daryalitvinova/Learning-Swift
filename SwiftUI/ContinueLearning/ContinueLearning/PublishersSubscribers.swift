//
//  PublishersSubscribers.swift
//  ContinueLearning
//
//  Created by Дарья Литвинова on 08.02.2026.
//

import SwiftUI
import Combine

class PublishersSubscribersViewModel: ObservableObject {
    @Published var count: Int = 0
    //var timer: AnyCancellable?
    var cancellables = Set<AnyCancellable>()
    
    // атрибут Published делает из переменной паблишера
    @Published var textFieldText: String = ""
    @Published var textIsValid: Bool = false
    @Published var enableButton: Bool = false
    
    init() {
        setUpTimer()
        addTextFieldSubscriber()
        addButtonSubscriber()
    }
    
    func addTextFieldSubscriber() {
        $textFieldText
            // интервал с которым паблишер должен отправлять значение
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map { (text) -> Bool in
                return text.count > 3
            }
            //.assign(to: \.textIsValid, on: self) // проблема assign в том, что тут self передается по сильной ссылке и это никак не изменить
            .sink(receiveValue: { [weak self] (value) in
                self?.textIsValid = value
            })
            .store(in: &cancellables)
    }
    
    func setUpTimer() {
        //timer = Timer // когда паблишер и сабскрайбер 1
        Timer
            .publish(every: 1.0, on: .main, in: .common)
            .autoconnect()
            .sink(receiveValue: { [weak self] (_) in
                guard let self = self else { return }
                
                self.count += 1
                
//                if self.count >= 10 {
//                    self.timer?.cancel()
//                }
//                if self.count >= 10 {
//                    for item in self.cancellables {
//                        item.cancel()
//                    }
//                }
            })
        // когда много паблишеров и сабскрайберов
            .store(in: &cancellables)
    }
    
    func addButtonSubscriber() {
        $textIsValid
        // подписывает на доп паблишера и публикует тапл
            .combineLatest($count)
            .sink { [weak self] (isValid, count) in
                guard let self = self else { return }
                self.enableButton = isValid && count >= 10
            }
            .store(in: &cancellables)
    }
}

struct PublishersSubscribers: View {
    
    @StateObject var viewModel =  PublishersSubscribersViewModel()
    
    var body: some View {
        VStack(spacing: 15) {
            Text("\(viewModel.count)")
                .font(.largeTitle)
            
            Text("\(viewModel.textIsValid.description)")
            
            TextField("Type something here...", text: $viewModel.textFieldText)
                .padding()
                .font(.headline)
                .frame(height: 50)
                .background(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))
                .foregroundStyle(.black)
                .clipShape(Capsule())
                .overlay(
                    ZStack {
                        Image(systemName: viewModel.textIsValid ? "checkmark" : "xmark")
                            .foregroundStyle(viewModel.textIsValid ? .green : .red)
                    }
                    .font(.title)
                    .padding()
                    , alignment: .trailing
                )
            
            Button(action: {}) {
                Text("Submit")
                    .frame(height: 40)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .disabled(!viewModel.enableButton)
        }
        .padding()
    }
}

#Preview {
    PublishersSubscribers()
}

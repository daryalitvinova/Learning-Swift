//
//  JSONDownloadingWithCombine.swift
//  ContinueLearning
//
//  Created by Дарья Литвинова on 07.02.2026.
//

import SwiftUI
import Combine

struct PostModelCombine: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class DownloadWithCombineViewModel: ObservableObject {
    @Published var posts: [PostModelCombine] = []
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        // https - обязательно, с http - ошибка
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        // 1. sign up for monthly subscription for package to be delivared
        // 2. the company would make the package behind the scene (example, print magazine in certain typography
        // 3. receive the package at your front door
        // 4. make sure the box isn't damaged
        // 5. open and make sure the item is correct
        // 6. use the item
        // 7. cancellable at any time!
        
        // 1. create the publisher
        URLSession.shared.dataTaskPublisher(for: url)
        // 2. subscribe publisher on background thread
        // не создает подписчика, ни на кого ничего не подписывает, говорит лишь о том, что когда начнется подписка (которую сделает sink),  выполни работу паблишера на такой-то очереди
            .subscribe(on: DispatchQueue.global(qos: .background)) // это не обязательно, так как dataTaskPublisher итак в background
        // 3. recieve on main thread
            //.receive(on: DispatchQueue.main)
        // 4. tryMap (check that the data is good)
//            .tryMap { (data, response) -> Data in
//                guard let response = response as? HTTPURLResponse,
//                      response.statusCode >= 200 && response.statusCode < 300 else {
//                    throw URLError(.badServerResponse)
//                }
//                
//                return data
//            }
            .tryMap(handleOutput)
        // 5. decode (decode data into PostModelCombine
            .decode(type: [PostModelCombine].self, decoder: JSONDecoder()) //так декодирование происходит на главном потоке, можно перенести выше вместе с tryMap, чтобы тоже было в фоне
        // 6. sink (put the item into our app
        // при ошбике в tryMap, она будет в completion
        // по сути это и есть настоящая подписка, на то что публикуется, именно тут создается сабскрайбер, который слушает
        // 3. recieve on main thread
            .receive(on: DispatchQueue.main)
//            .sink { (completion) in
//                switch completion {
//                case .finished:
//                    print("Finished!")
//                case .failure(let error):
//                    print("There was an error. \(error)")
//                }
//            } receiveValue: { [weak self] (returnedValue) in
//                self?.posts = returnedValue
//            }
        // можно заменить в sink completion на replaceError, тогда при ошибке, ошибка будет заменяться на заданное значение
            .replaceError(with: [])
            .sink(receiveValue: { [weak self] (returnedValue) in
                self?.posts = returnedValue
            })
        // 7. store (cancel subscription if needed)
            .store(in: &cancellables)
    }
    
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        
        return output.data
    }
}


struct JSONDownloadingWithCombine: View {
    @StateObject var viewModel = DownloadWithCombineViewModel()
    var body: some View {
        List {
            ForEach(viewModel.posts) { post in
                VStack {
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .foregroundStyle(.gray)
                }
            }
        }
    }
}

#Preview {
    JSONDownloadingWithCombine()
}

//
//  PhotoModelDataService.swift
//  ContinueLearning
//
//  Created by Дарья Литвинова on 09.02.2026.
//

import Foundation
import Combine

class PhotoModelDataService {
    static let shared = PhotoModelDataService()
    
    @Published var photos: [PhotoModel] = []
    var cancellables: Set<AnyCancellable> = []
    
    func dowloadData() {
        guard let url = URL(string: "https://fakestoreapi.com/products") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap(handleOutput)
            .decode(type: [PhotoModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error downloading data. \(error)")
                }
            } receiveValue: { [weak self] (returnedValue) in
                self?.photos = returnedValue
            }
            .store(in: &cancellables)
    }
    
    private init() {
        dowloadData()
    }
    
    private func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
              }
        return output.data
    }
}

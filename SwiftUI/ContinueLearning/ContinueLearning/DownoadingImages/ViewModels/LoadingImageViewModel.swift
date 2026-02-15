//
//  DownloadingImageViewModel.swift
//  ContinueLearning
//
//  Created by Дарья Литвинова on 09.02.2026.
//
import SwiftUI
import Combine

class LoadingImageViewModel: ObservableObject {
    @Published var image: UIImage?
    @Published var isLoading: Bool = false
    var cancellables: Set<AnyCancellable> = []
    
    let urlString: String
    let imageKey: String
    // очевидно, что при PhotoCacheManager используется больше памяти и не сохраняется между запусками
    let manager = PhotoCacheManager.shared
    // с FileManager памяти используется меньше, сохраняется между запусками, но в этом и есть суть, это все хранится постоянно
    //let manager = PhotoFileManager.shared
    
//    let uiDelay: TimeInterval = 2.0 // Delay before delivering data to UI
    
    init(url: String, key: String) {
        urlString = url
        imageKey = key
        // в такой реализации будем скачивать изображение каждый раз когда оно появляется на экране, то есть и при любом скролле, поэтому нужен кэш
        //downloadImage()
        
        getImage()
    }
    
    func getImage() {
        if let savedImage = manager.get(key: imageKey) {
            image = savedImage
            print("Getting saved image")
        } else {
            downloadImage()
            print("Downloading image now!")
        }
    }
    
    func downloadImage() {
        isLoading = true
        
        guard let url = URL(string: urlString) else {
            isLoading = false
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            // Delay delivering the value to the UI
//            .delay(for: .seconds(uiDelay), scheduler: DispatchQueue.main)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.isLoading = false // completion
            } receiveValue: { [weak self] returnedValue in
                guard let self = self,
                      let image = returnedValue else { return }
                self.image = image
                self.manager.add(key: self.imageKey, value: image)
            }
            .store(in: &cancellables)
    }
}

//
//  DownloadingImagesViewModel.swift
//  ContinueLearning
//
//  Created by Дарья Литвинова on 09.02.2026.
//
import Foundation
import Combine

class DownloadingImagesViewModel: ObservableObject {
    @Published var dataArray: [PhotoModel] = []
    let photoService = PhotoModelDataService.shared
    var cancellables: Set<AnyCancellable> = []
    
    init() {
        addSubscriber()
    }
    
    func addSubscriber() {
        photoService.$photos
            .sink { [weak self] (returnedPhotos) in
                self?.dataArray = returnedPhotos
            }
            .store(in: &cancellables)
    }
}

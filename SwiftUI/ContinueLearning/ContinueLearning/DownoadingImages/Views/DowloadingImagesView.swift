//
//  DowloadingImages.swift
//  ContinueLearning
//
//  Created by Дарья Литвинова on 09.02.2026.
//

import SwiftUI

struct DowloadingImagesView: View {
    @StateObject var viewModel = DownloadingImagesViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.dataArray) { photo in
                    DownloadedPhotoRowView(photo: photo)
                }
            }
            .navigationTitle("Downloading photos")
        }
    }
}

#Preview {
    DowloadingImagesView()
}

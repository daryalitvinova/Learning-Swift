//
//  DownloadedPhotoRow.swift
//  ContinueLearning
//
//  Created by Дарья Литвинова on 09.02.2026.
//
import SwiftUI

struct DownloadedPhotoRowView: View {
    let photo: PhotoModel
    
    var body: some View {
        HStack {
            LoadingImageView(url: photo.image, key: "\(photo.id)")
                .frame(width: 70, height: 70)
            VStack(alignment: .leading) {
                Text(photo.title)
                    .font(.headline)
                Text(photo.image)
                    .foregroundStyle(.gray)
                    .italic()
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}


#Preview {
    DownloadedPhotoRowView(photo: PhotoModel(id: 1, title: "haha", category: "food", image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png"))
}

//
//  DownloadingImageView.swift
//  ContinueLearning
//
//  Created by Дарья Литвинова on 09.02.2026.
//

import SwiftUI

struct LoadingImageView: View {
    // это property wrapper, и его нужно инициализировать именно как wrapper, а не просто присвоить обернутому значению
    // @StateObject управляет жизненным циклом объекта и хранит его состояние между перерисовками вью.
    @StateObject var loader: LoadingImageViewModel
    
    init(url: String, key: String) {
        // внутри init нельзя напрямую присвоить значение loader, потому что это не обычное свойство, а обернуток. Вместо этого инициализируется его storage
        _loader = StateObject(wrappedValue: LoadingImageViewModel(url: url, key: key))
    }
    
    var body: some View {
        ZStack {
            if loader.isLoading {
                ProgressView()
            } else if let image = loader.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
            }
        }
    }
}

#Preview {
    LoadingImageView(url: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png", key: "1")
        .frame(width: 75, height: 75)
}

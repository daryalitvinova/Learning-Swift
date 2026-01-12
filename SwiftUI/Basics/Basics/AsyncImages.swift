//
//  AsyncImages.swift
//  Basics
//
//  Created by Дарья Литвинова on 07.12.2025.
//

import SwiftUI

struct AsyncImages: View {
    
    private let url = URL(string: "https://picsum.photos/400")
    
    var body: some View {
        // Даже если установили фрейм, картинка все равно остается своего размера
        //AsyncImage(url: url)
        //    .frame(width: 100, height: 100)
//        AsyncImage(
//            url: url,
//            content: { returnedImage in
//                returnedImage
//                    .resizable()
//                    .frame(width: 100, height: 100)
//            },
//            placeholder: {
//                ProgressView()
//            })
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                ProfileView()
                // returnedImage берется из ассоциированного значения
            case .success(let returnedImage):
                returnedImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            case .failure:
                Image(systemName: "questionmark")
                    .font(.headline)
            default:
                Image(systemName: "questionmark")
                    .font(.headline)
            }
        }
    }
}

#Preview {
    AsyncImages()
}

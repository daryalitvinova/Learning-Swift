//
//  Caches.swift
//  ContinueLearning
//
//  Created by Дарья Литвинова on 09.02.2026.
//

import SwiftUI
import Combine

class CacheManager {
    static let shared = CacheManager()
    private init() {}
    
    var imageCache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 100 * 1024 * 1024 // 100mb
        
        return cache
    }()
    
    func add(image: UIImage, name: String) -> String {
        imageCache.setObject(image, forKey: name as NSString)
        return "Added to cache!"
    }
    
    func get(name: String) -> UIImage? {
        return imageCache.object(forKey: name as NSString)
    }
    
    func remove(name: String) -> String {
        imageCache.removeObject(forKey: name as NSString)
        return "Removed from cache!"
    }
 }

class CacheViewModel: ObservableObject {
    @Published var startingImage: UIImage?
    @Published var cachedImage: UIImage?
    let imageName = "steve-jobs"
    let manager = CacheManager.shared
    @Published var infoMessage: String = ""
    
    
    init() {
        getImageFronAssets()
    }
    
    func getImageFronAssets() {
        startingImage = UIImage(named: imageName)
    }
    
    func saveToCache() {
        guard let image = startingImage else { return }
        infoMessage = manager.add(image: image, name: imageName)
    }
    
    func removeFromCache() {
        infoMessage = manager.remove(name: imageName)
    }
    
    func getFromCache() {
        cachedImage = manager.get(name: imageName)
    }
}

struct Caches: View {
    @StateObject var viewModel = CacheViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if let image  = viewModel.startingImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300, height: 300)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                Text(viewModel.infoMessage)
                    .padding()
                
                HStack {
                    Button(
                        action: {
                            viewModel.saveToCache()
                        },
                        label: {
                            Text("Save to Cache")
                                .font(.headline)
                                .frame(width: 150)
                                .padding(8)
                        })
                    .buttonStyle(.glassProminent)
                    
                    Button(
                        action: {
                            viewModel.removeFromCache()
                        },
                        label: {
                            Text("Delete from Cache")
                                .font(.headline)
                                .frame(width: 150)
                                .padding(8)
                        })
                    .buttonStyle(.glassProminent)
                    .tint(.red)
                }
                
                Button(
                    action: {
                        viewModel.getFromCache()
                    },
                    label: {
                        Text("Get from Cache")
                            .font(.headline)
                            .frame(width: 150)
                            .padding(8)
                    })
                .buttonStyle(.glassProminent)
                .tint(.green)
                
                if let image  = viewModel.cachedImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                Spacer()
            }
            .navigationTitle("Cache")
        }
    }
}

#Preview {
    Caches()
}

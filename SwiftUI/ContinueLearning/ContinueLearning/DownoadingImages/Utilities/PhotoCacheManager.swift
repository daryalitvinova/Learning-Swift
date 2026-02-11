//
//  PhotoCacheManger.swift
//  ContinueLearning
//
//  Created by Дарья Литвинова on 10.02.2026.
//
import Foundation
import SwiftUI

class PhotoCacheManager {
    static let shared = PhotoCacheManager()
    private init() { }
    
    var photoCache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 200 * 1024 * 1024 // 200mb
        return cache
    }()
    
    func add(key: String, value: UIImage) {
        photoCache.setObject(value, forKey: key as NSString)
    }
    
    func get(key: String) -> UIImage? {
        return photoCache.object(forKey: key as NSString)
    }
}

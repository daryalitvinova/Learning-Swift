//
//  PhotoFileManager.swift
//  ContinueLearning
//
//  Created by Дарья Литвинова on 10.02.2026.
//
import Foundation
import SwiftUI

class PhotoFileManager {
    static let shared = PhotoFileManager()
    private let folderName = "downloaded_photos"
    private init() {
        createFolderIfNeeded()
    }
    
    private func createFolderIfNeeded() {
        guard let url = getFolderPath() else { return }
        
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
                print("Folder created!")
            } catch let error {
                print("Error creating a folder. \(error)")
            }
        }
    }
    
    private func getFolderPath() -> URL? {
        return FileManager
            .default
            .urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent(folderName)
    }
    
    private func getImagePath(key: String) -> URL? {
        guard let folderPath = getFolderPath() else { return nil }
        
        return folderPath.appendingPathComponent(key + ".png")
    }
    
    func add(key: String, value: UIImage) {
        guard let url = getImagePath(key: key),
              let data = value.pngData() else { return }
        
        do {
            try data.write(to: url)
        } catch let error {
            print("Error saving to file manager. \(error)")
        }
    }
    
    func get(key: String) -> UIImage? {
        guard let url = getImagePath(key: key),
              FileManager.default.fileExists(atPath: url.path) else { return nil }
        return UIImage(contentsOfFile: url.path)
    }
}

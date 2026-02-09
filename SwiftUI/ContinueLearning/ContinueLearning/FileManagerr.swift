//
//  FileManagerr.swift
//  ContinueLearning
//
//  Created by Дарья Литвинова on 08.02.2026.
//

import SwiftUI
import Combine

class LocalFileManager {
    static let instance = LocalFileManager()
    
    let folderName = "MyApp_Images"
    
    init() {
        createFolderIfNeeded()
    }
    
    private func createFolderIfNeeded() {
        guard let path = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent(folderName)
            .path else { return }
        
        if !FileManager.default.fileExists(atPath: path) {
            do {
                //withIntermediateDirectories = true - создать все промежуточные папки
                try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
            } catch let error {
                print("Error creating folder. \(error)")
            }
        }
    }
    
    func deleteFolder() {
        guard let path = FileManager
            .default
            .urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent(folderName)
            .path else {
            return
        }
        
        do {
            try FileManager.default.removeItem(atPath: path)
            print("Success deleting folder")
        } catch let error {
            print("Error deleting folder. \(error)")
        }
    }
    
    func saveImage(image: UIImage, name: String) -> String {
        guard let data = image.jpegData(compressionQuality: 1.0),
              let path = getPathForImage(name: name) else {
            return "Error getting data."
        }
        
//        let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        let directory2 = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
//        let directory3 = FileManager.default.temporaryDirectory
//        
//        print(directory)
//        print(directory2)
//        print(directory3)
        
        do {
            try data.write(to: path)
            print(path)
            return "Success saving!"
        } catch let error {
            return "Error saving. \(error)"
        }
    }
    
    func getPathForImage(name: String) -> URL? {
        guard let path = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent(folderName)
            .appendingPathComponent("\(name).jpg") else {
            print("Error getting path.")
            return nil
        }
        
        return path
    }
    
    func getImage(name: String) -> UIImage? {
        guard let path = getPathForImage(name: name)?.path,
              FileManager.default.fileExists(atPath: path) else {
            print("Error getting path.")
            return nil
        }
        
        return UIImage(contentsOfFile: path)
    }
    
    func deleteImage(name: String) -> String {
        guard let path = getPathForImage(name: name),
              FileManager.default.fileExists(atPath: path.path) else {
            return "Error getting path."
        }
        
        do {
            try FileManager.default.removeItem(at: path)
            return "Successfully deleted."
        } catch let error {
            return "Error deleting image. \(error)"
        }
    }
}

class FileManagerrViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    let imageName: String = "steve-jobs"
    
    let manager = LocalFileManager()
    @Published var infoMessage: String = ""
    
    init() {
        getImageFromAssetsFolder()
        //getImageFromFileManager()
    }
    
    func getImageFromAssetsFolder() {
        image = UIImage(named: imageName)
    }
    
    func getImageFromFileManager() {
        image = manager.getImage(name: imageName)
    }
    
    func saveImage() {
        guard let image = image else { return }
        infoMessage = manager.saveImage(image: image, name: imageName)
    }
    
    func deleteImage() {
        infoMessage = manager.deleteImage(name: imageName)
        manager.deleteFolder()
    }
}

struct FileManagerr: View {
    @StateObject var viewModel = FileManagerrViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if let image = viewModel.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                }
                
                HStack {
                    Button {
                        viewModel.saveImage()
                    } label: {
                        Text("Save to FM")
                            .font(.headline)
                            .frame(width: 150, height: 30)
                    }
                    .buttonStyle(.glassProminent)
                    .tint(.green)
                    
                    Button {
                        viewModel.deleteImage()
                    } label: {
                        Text("Delete from FM")
                            .font(.headline)
                            .frame(width: 150, height: 30)
                    }
                    .buttonStyle(.glassProminent)
                    .tint(.red)
                }
                
                Text(viewModel.infoMessage)
                
                Spacer()
            }
            .navigationTitle("File Manager")
        }
    }
}

#Preview {
    FileManagerr()
}

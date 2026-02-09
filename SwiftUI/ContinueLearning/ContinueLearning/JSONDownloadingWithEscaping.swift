//
//  JSONDownloadingWithEscaping.swift
//  ContinueLearning
//
//  Created by Дарья Литвинова on 06.02.2026.
//

import SwiftUI
import Combine

struct PostModel: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class DownloadWithEscapingViewModel: ObservableObject {
    @Published var posts: [PostModel] = []
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            print("Invalid URL")
            return }
        
        downloadData(fromURL: url) { data in
            if let data = data {
                guard let newPosts = try? JSONDecoder().decode([PostModel].self, from: data) else { return }
                DispatchQueue.main.async { [weak self] in
                    self?.posts = newPosts
                }
            }
        }
    }
    
    func downloadData(fromURL url: URL, completionHandler: @escaping (_ data: Data?) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data,
                  error == nil,
                  let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 else {
                print("Error downloading data")
                completionHandler(nil)
                return
            }
            
//            guard let data = data else {
//                print("No data")
//                return
//            }
//            
//            guard error == nil else {
//                print("Error: \(String(describing: error))")
//                return
//            }
//            
//            guard let httpResponse = response as? HTTPURLResponse else {
//                print("Invalid response")
//                return
//            }
//            
//            guard httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 else {
//                print("Status code should be 2xx, but is \(httpResponse.statusCode)")
//                return
//            }
            
            print("SUCCESSFULLY DOWNLOADED DATA!")
            print(data)
            let jsonString = String(data: data, encoding: .utf8)
            print(jsonString)
    
            DispatchQueue.main.async { [weak self] in
                guard let newPost = try? JSONDecoder().decode(PostModel.self, from: data) else { return }
                self?.posts.append(newPost)
            }
            completionHandler(data)
        }.resume()
    }
}

struct JSONDownloadingWithEscaping: View {
    
    @StateObject var viewModel = DownloadWithEscapingViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.posts) { post in
                VStack {
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .foregroundStyle(.gray)
                }
            }
        }
    }
}

#Preview {
    JSONDownloadingWithEscaping()
}

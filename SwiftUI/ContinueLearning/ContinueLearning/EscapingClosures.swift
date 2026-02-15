//
//  EscapingClosures.swift
//  ContinueLearning
//
//  Created by Дарья Литвинова on 05.02.2026.
//

import SwiftUI
import Combine

class EscapingViewModel: ObservableObject {
    @Published var text: String = "Hello"
    
    func getData() {
//        let newData = downloadData()
//        text = newData
        
//        downloadData2 { (returnedData) in
//            text = returnedData
//        }
        
        // теперь замыкание сбегающее, и нужна ссылка на объект, но чтобы не добавлять сильную ссылку, добавим weak self
//        downloadData3 { [weak self] (returnedData) in
//            self?.text = returnedData
//        }
        
        downloadData4 { [weak self] (returnedResult) in
            self?.text = returnedResult.data
        }
        
    }
    
    private func downloadData() -> String {
        return "New Data!"
    }
    
    // эта ожидает что результат completionHandler вернется сразу, но что если в нашем случае нет?
    private func downloadData2(completionHandler: (_ data: String) -> /*Void*/()) {
        completionHandler("New Data!")
    }
    
    private func downloadData3(completionHandler: @escaping (_ data: String) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            completionHandler("New Data!")
        }
    }
    
    private func downloadData4(completionHandler: @escaping (DownloadResult) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let result = DownloadResult(data: "New Data!")
            completionHandler(result)
        }
    }
    
    private func downloadData5(completionHandler: @escaping DownloadCompletion) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let result = DownloadResult(data: "New Data!")
            completionHandler(result)
        }
    }
}

struct DownloadResult {
    let data: String
}

typealias DownloadCompletion = (DownloadResult) -> ()

struct EscapingClosures: View {
    @StateObject var viewModel = EscapingViewModel()
    
    var body: some View {
        Text(viewModel.text)
            .onTapGesture {
                viewModel.getData()
            }
    }
}

#Preview {
    EscapingClosures()
}

//
//  Model.swift
//  helloApp
//
//  Created by Дарья Литвинова on 07.10.2025.
//

import Foundation

struct WordModel {
    var word: String = ""
    
    init(_ word: String = "hello") {
        self.word = word
    }
    
    func changeWord(_ text: String) -> String {
        return text == "leohl" ? word : ""
    }
}

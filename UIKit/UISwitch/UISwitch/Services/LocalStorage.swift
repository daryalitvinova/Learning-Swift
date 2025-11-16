//
//  LocalStorage.swift
//  UISwitch
//
//  Created by Дарья Литвинова on 16.10.2025.
//

import Foundation

class LocalStorage {
    
    static let shared = LocalStorage()
    
    private init() {}
    
    func save(data: [String: String], key: String) {
        UserDefaults.standard.set(data, forKey: "userProfile")
    }
    
    func load(key: String) -> [String: String]? {
        guard let data = UserDefaults.standard.dictionary(forKey: "userProfile") as? [String: String] else { return nil }
        return data
    }
}

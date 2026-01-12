//
//  AppStorageUserDefaults.swift
//  Basics
//
//  Created by Дарья Литвинова on 03.12.2025.
//

import SwiftUI

struct AppStorageUserDefaults: View {
    
    //@State var currentUserName: String?
    @AppStorage("name") var currentUserName: String?
    
    var body: some View {
        VStack(spacing: 20) {
            Text(currentUserName ?? "Add Name")
            
            Button("Save") {
                currentUserName = "Alisa"
//                UserDefaults.standard.set(currentUserName, forKey: "name")
            }
        }
//        .onAppear() {
//            currentUserName = UserDefaults.standard.string(forKey: "name")
//        }
    }
}

#Preview {
    AppStorageUserDefaults()
}

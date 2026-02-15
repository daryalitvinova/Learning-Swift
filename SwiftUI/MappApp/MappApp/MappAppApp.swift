//
//  MappAppApp.swift
//  MappApp
//
//  Created by Дарья Литвинова on 12.01.2026.
//

import SwiftUI

@main
struct MappAppApp: App {
    
    @StateObject private var viewModel = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
            // теперь все, что в этом вью или дочерних вью имеет доступ к этой вью модели
                .environmentObject(viewModel)
        }
    }
}

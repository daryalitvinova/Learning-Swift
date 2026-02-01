//
//  FetchRequestCoreDataApp.swift
//  FetchRequestCoreData
//
//  Created by Дарья Литвинова on 31.01.2026.
//

import SwiftUI
import CoreData

@main
struct FetchRequestCoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

//
//  ContinueLearningApp.swift
//  ContinueLearning
//
//  Created by Дарья Литвинова on 22.01.2026.
//

import SwiftUI

@main
struct ContinueLearningApp: App {
    init() {
        // когда делегат не назначен, willPresent не реализован, тогда все идет по дефолтному поведению, то есть не показывает уведомление, если приложение активно
        UNUserNotificationCenter.current().delegate = NotificationDelegate.shared
    }
    
    var body: some Scene {
        WindowGroup {
            EnDeCodable()
        }
    }
}

final class NotificationDelegate: NSObject, UNUserNotificationCenterDelegate {
    static let shared = NotificationDelegate()
}

extension NotificationDelegate {
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
            // это обратный вызов, говорит что показывать
            completionHandler([.banner, .badge, .sound])
        }
}

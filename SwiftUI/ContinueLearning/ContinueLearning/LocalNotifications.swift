//
//  LocalNotifications.swift
//  ContinueLearning
//
//  Created by Дарья Литвинова on 28.01.2026.
//

import SwiftUI
import CoreLocation

// по умолчанию уведомления приходят только если приложение в фоне

class NotificationManager {
    static let shared = NotificationManager()
    
    private init() { }
    
    func requestPermission() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print("ERROR: \(error)")
            } else {
                print("SUCCESS")
            }
        }
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "This is my first notification!"
        content.subtitle = "This was sooooo cool!"
        content.sound = .default
        // чтобы делать +1 надо хранить текущее значение badge, например, это делают в UserDefaults
        content.badge = 1
        
        // time
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
        // calendar
//        var dateComponents = DateComponents()
//        dateComponents.hour = 17
//        dateComponents.minute = 26
//        //dateComponents.weekday
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        // location
//        let coordinates = CLLocationCoordinate2D(
//            latitude: 40.00,
//            longitude: 50.00)
//        
//        let region = CLCircularRegion(
//            center: coordinates,
//            radius: 100,
//            identifier: UUID().uuidString)
//        region.notifyOnEntry = true
//        region.notifyOnExit = true
//
//        let trigger = UNLocationNotificationTrigger(region: region, repeats: false)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
        UNUserNotificationCenter.current().setBadgeCount(0)
    }
}

struct LocalNotifications: View {
    var body: some View {
        VStack(spacing: 30) {
            Button("Request permission") {
                // если переустановить приложение, то есть при удалении app data, разрешение снова будет запрошено, иначе это окно появляется только при первом нажатии на кнопку
                NotificationManager.shared.requestPermission()
            }
            Button("Schedule notification") {
                NotificationManager.shared.scheduleNotification()
            }
            Button("Cancel notifications") {
                NotificationManager.shared.cancelNotification()
            }
        }
        // возникает не обязательно когда active, может быть .inactive, переход из background, переход из уведомления, и badge может быть проигнорирован, правильно это делать - реагировать на scenePhase == .active
        .onAppear {
            UNUserNotificationCenter.current().setBadgeCount(0)
        }
    }
}

#Preview {
    LocalNotifications()
}

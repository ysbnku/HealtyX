//
//  NotificationManager.swift
//  HealtyX
//
//  Created by Yavuz Selim BİTMEZ on 7.07.2021.
//

import Foundation
import UserNotifications

class NotificationManager {
    static let shared = NotificationManager()
    let notificationCenter = UNUserNotificationCenter.current()
    
    func permissionRequestForNotification() {
        notificationCenter.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            print((error != nil) ? print(error as Any) : print("***Notification permission authorized"))
        }
    }
    
    func createNotification(notification: Notification , dateComponents: DateComponents) {
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = notification.title
        notificationContent.subtitle = notification.subtitle
        notificationContent.body = notification.body
        let dateTrigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let identifier = notification.identifier
        let request = UNNotificationRequest(identifier: identifier, content: notificationContent, trigger: dateTrigger)
        notificationCenter.add(request)
    }
    
    func removeNotifications(identifier: String) {
        UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: [identifier])
    }
    
}

struct Notification {
    var id: Int
    var title: String
    var subtitle: String
    var body: String
    var identifier: String
}

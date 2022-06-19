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
    
    private func createNotification(notification: Notification , dateComponents: DateComponents) {
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = notification.title
        notificationContent.subtitle = notification.subtitle
        notificationContent.body = notification.body
        let dateTrigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let identifier = notification.identifier
        let request = UNNotificationRequest(identifier: identifier, content: notificationContent, trigger: dateTrigger)
        notificationCenter.add(request)
    }
    
    func createNotificationDateByPrograms(_ program:NotificationPrograms) {
        let notificationLists = Notification(id: 2, title: "title", subtitle: "Subtitle", body: "Body", identifier: "Basic")
        var dateComponents = DateComponents()
        dateComponents.year = Calendar.current.component(.year, from: Date())
        dateComponents.month = Calendar.current.component(.month, from: Date())
        dateComponents.day = 18
        dateComponents.timeZone = TimeZone(abbreviation: "TRT")
        dateComponents.hour = 19
        dateComponents.minute = 59
        
    }
    
    private func getNotificationLists(_ program: NotificationPrograms) -> [Notification] {
        var notificationList: [Notification]? = []
        switch program {
        case .easy:
            notificationList?.append(Notification(id: 1, title: "SuTitle", subtitle: "Su İç subtitle", body: "Su iç body", identifier: "easy"))
            notificationList?.append(Notification(id: 1, title: "SuTitle", subtitle: "Su İç subtitle", body: "Su iç body", identifier: "easy"))
            notificationList?.append(Notification(id: 1, title: "SuTitle", subtitle: "Su İç subtitle", body: "Su iç body", identifier: "easy"))
        case .normal:
            notificationList?.append(Notification(id: 1, title: "NormalTitle", subtitle: "Normalsubtitle", body: "Normalbody", identifier: "normal"))
            notificationList?.append(Notification(id: 1, title: "NormalTitle", subtitle: "Normalsubtitle", body: "Normalbody", identifier: "normal"))
            notificationList?.append(Notification(id: 1, title: "NormalTitle", subtitle: "Normalsubtitle", body: "Normalbody", identifier: "normal"))
        case .hard:
            notificationList?.append(Notification(id: 1, title: "SuTitle", subtitle: "Su İç subtitle", body: "Su iç body", identifier: "hard"))
            notificationList?.append(Notification(id: 1, title: "SuTitle", subtitle: "Su İç subtitle", body: "Su iç body", identifier: "hard"))
            notificationList?.append(Notification(id: 1, title: "SuTitle", subtitle: "Su İç subtitle", body: "Su iç body", identifier: "hard"))
        }
        return notificationList ?? <#default value#>
    }
    
    func removeNotifications(identifier: String) {
        UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: [identifier])
    }
    
}

enum NotificationPrograms {
    case easy
    case normal
    case hard
}

struct Notification {
    var id: Int
    var title: String
    var subtitle: String
    var body: String
    var identifier: String
}

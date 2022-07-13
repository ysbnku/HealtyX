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
    
    private func createNotification(_ notification: Notification) {
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = notification.title
        notificationContent.subtitle = notification.subtitle
        notificationContent.body = notification.body
        let dateTrigger = UNCalendarNotificationTrigger(dateMatching: notification.nfDate, repeats: true)
        let identifier = notification.identifier
        let request = UNNotificationRequest(identifier: identifier, content: notificationContent, trigger: dateTrigger)
        notificationCenter.add(request)
        print("***\(notification) notification created")

    }
    
    func createNotificationByPrograms(_ program:NotificationPrograms) {
        let notificationList = prepareNotificationLists(program)
        for notification in notificationList {
            createNotification(notification)
        }
    }
    
    private func prepareNotificationLists(_ program: NotificationPrograms) -> [Notification] {
        var notificationList: [Notification]? = []
        
        switch program {
        case .easy:
            notificationList?.append(prepareNotification(.easy, .morning))
            notificationList?.append(prepareNotification(.easy, .noon))
            notificationList?.append(prepareNotification(.easy, .afterNoon))
            notificationList?.append(prepareNotification(.easy, .evening))
            notificationList?.append(prepareNotification(.easy, .night))

        case .normal:
            notificationList?.append(prepareNotification(.normal, .morning))
            notificationList?.append(prepareNotification(.normal, .noon))
            notificationList?.append(prepareNotification(.normal, .afterNoon))
            notificationList?.append(prepareNotification(.normal, .evening))
            notificationList?.append(prepareNotification(.normal, .night))

        case .hard:
            notificationList?.append(prepareNotification(.hard, .morning))
            notificationList?.append(prepareNotification(.hard, .noon))
            notificationList?.append(prepareNotification(.hard, .afterNoon))
            notificationList?.append(prepareNotification(.hard, .evening))
            notificationList?.append(prepareNotification(.hard, .night))


        }
        
        return notificationList ?? [Notification]()
    }
    
    private func getNotificationDate(time: NotificationTime) -> DateComponents {
        let randomMinute = Int.random(in: 0..<60)
        var notificationHour: Int
        switch time {
        case .morning:
            notificationHour = 8
        case .noon:
            notificationHour = 11
        case .afterNoon:
            notificationHour = 14
        case .evening:
            notificationHour = 17
        case .night:
            notificationHour = 20
        }
        var dateComponents = DateComponents()
        dateComponents.timeZone = NSTimeZone.system
        dateComponents.hour = notificationHour
        dateComponents.minute = randomMinute
        
        return dateComponents
    }
    
    private func prepareNotification(_ programs: NotificationPrograms, _ time: NotificationTime) -> Notification {
        let nf: Notification!
        switch programs {
        case .easy:
            nf = Notification(
                title: "Easy Title",
                subtitle: "Easy Title",
                body: "Easy Title",
                identifier: "easy",
                nfDate: getNotificationDate(time: time))
            
        case .normal:
            nf = Notification(
                title: "Normal Title",
                subtitle: "Normal Title",
                body: "Normal Title",
                identifier: "normal",
                nfDate: getNotificationDate(time: time))
            
        case .hard:
            nf = Notification(
                title: "Hard Title",
                subtitle: "Hard Title",
                body: "Hard Title",
                identifier: "hard",
                nfDate: getNotificationDate(time: time))
        }
  
        return nf
    }
    
    func removeNotifications(identifier: String) {
        UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: [identifier])
        print("***\(identifier) notifications removed")
    }
    
    func permissionRequestForNotification() {
        notificationCenter.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            print((error != nil) ? print(error as Any) : print("***Notification permission authorized"))
        }
    }
    
}

enum NotificationPrograms: Int {
    case easy = 0
    case normal
    case hard
}

enum NotificationTime: Int {
    case morning
    case noon
    case afterNoon
    case evening
    case night
}

struct Notification {
    var title: String
    var subtitle: String
    var body: String
    var identifier: String
    var nfDate: DateComponents
}

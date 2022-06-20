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
            notificationList?.append(prepareNotification(.easy))
            notificationList?.append(prepareNotification(.easy))
            notificationList?.append(prepareNotification(.easy))

           
        case .normal:
            notificationList?.append(prepareNotification(.normal))
            notificationList?.append(prepareNotification(.normal))
            notificationList?.append(prepareNotification(.normal))


        case .hard:
            notificationList?.append(prepareNotification(.hard))
            notificationList?.append(prepareNotification(.hard))
            notificationList?.append(prepareNotification(.hard))

        }
        
        return notificationList ?? [Notification]()
    }
    
    private func getNotificationDate() -> DateComponents {
        var dateComponents = DateComponents()
        dateComponents.timeZone = NSTimeZone.system
        dateComponents.hour = 10
        dateComponents.minute = 51
        
        return dateComponents
    }
    
    private func prepareNotification(_ programs: NotificationPrograms) -> Notification {
        let nf: Notification!
        switch programs {
        case .easy:
            nf = Notification(title: "Easy Title",
                                  subtitle: "Easy Title",
                                  body: "Easy Title",
                                  identifier: "Easy Title",
                                  nfDate: getNotificationDate())
        case .normal:
            nf = Notification(title: "Normal Title",
                                  subtitle: "Normal Title",
                                  body: "Normal Title",
                                  identifier: "Normal Title",
                                  nfDate: getNotificationDate())
        case .hard:
            nf = Notification(title: "Hard Title",
                                  subtitle: "Hard Title",
                                  body: "Hard Title",
                                  identifier: "Hard Title",
                                  nfDate: getNotificationDate())
        }
  
        return nf
    }
    
    func removeNotifications(identifier: String) {
        UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: [identifier])
    }
    
    func permissionRequestForNotification() {
        notificationCenter.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            print((error != nil) ? print(error as Any) : print("***Notification permission authorized"))
        }
    }
    
}

enum NotificationPrograms {
    case easy
    case normal
    case hard
}

struct Notification {
    var title: String
    var subtitle: String
    var body: String
    var identifier: String
    var nfDate: DateComponents
}

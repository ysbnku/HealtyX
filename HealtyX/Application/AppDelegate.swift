//
//  AppDelegate.swift
//  Example
//
//  Created by Yavuz Selim BİTMEZ on 7.07.2021.
//

import UIKit


@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        NotificationManager.shared.permissionRequestForNotification()
        return true
    }


}


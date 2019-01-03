//  AppDelegate.swift
//  Checklists
//
//  Created by Artur on 1/15/18.
//  Copyright © 2018 Artur. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    // MARK: - Properties
    
    var window: UIWindow?
    let dataModel = DataModel()
    
    // MARK: - UIResponder, UIApplicationDelegate
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let navigationController = window!.rootViewController as! UINavigationController
        let controller = navigationController.viewControllers[0] as! AllListsTableViewController
        controller.dataModel = dataModel
        
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        
        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        saveData()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        saveData()
    }
    
    // MARK: - Private methods
    
    func saveData() {
        dataModel.saveChecklists()
    }
    
    // MARK: - UNUserNotificationCenterDelegate
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    }
    
}


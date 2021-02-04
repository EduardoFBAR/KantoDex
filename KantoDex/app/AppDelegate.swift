//
//  AppDelegate.swift
//  KantoDex
//
//  Created by Eduardo Flores Belo on 1/2/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if window == nil {
            window = UIWindow(frame: UIScreen.main.bounds)
        }
        
        if let appWindow = window {
            Router.sharedInstance.setWindow(appWindow)
            Router.sharedInstance.loadHomeScreen()
        }
        
        return true
    }
    
}

//
//  AppDelegate.swift
//  MovieTrending
//
//  Created by BJIT on 21/11/24.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = MainViewController()
        window.makeKeyAndVisible()

        self.window = window

        return true
    }



}


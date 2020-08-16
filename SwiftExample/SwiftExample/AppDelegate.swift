//
//  AppDelegate.swift
//  SwiftExample
//
//  Created by admin on 16/8/2020.
//  Copyright © 2020 zd. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow.init()
        self.window?.rootViewController = ViewController.init()
        self.window?.makeKeyAndVisible()
        return true
    }

   


}


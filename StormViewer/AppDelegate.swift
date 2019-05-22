//
//  AppDelegate.swift
//  StormViewer
//
//  Created by Pedro Eusébio on 11/05/2019.
//  Copyright © 2019 Pedro Eusébio. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = UIColor.white
        
        let viewController = ViewController()
        
        let navigationController = UINavigationController(rootViewController: viewController)
        
        window?.rootViewController = navigationController
        return true
    }
}


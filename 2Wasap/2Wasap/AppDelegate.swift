//
//  AppDelegate.swift
//  2Wasap
//
//  Created by user159106 on 2/2/20.
//  Copyright © 2020 user159106. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window : UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController(rootViewController: ViewController(nibName: nil, bundle: nil))
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        
        return true
    }

    

}


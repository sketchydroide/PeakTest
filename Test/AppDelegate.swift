//
//  AppDelegate.swift
//  test
//
//  Created by Andre_Fonseca on 10/12/2017.
//  Copyright © 2017 Andre_Fonseca. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let aBTestApi = ABTestApi()
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        UIApplication.shared.statusBarStyle = .lightContent
        return true
    }
    
}


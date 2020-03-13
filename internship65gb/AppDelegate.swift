//
//  AppDelegate.swift
//  internship65gb
//
//  Created by Miska  on 26.02.2020.
//  Copyright © 2020 Miska . All rights reserved.
//

import UIKit
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    let googleService = GoogleService()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        googleService.setClientID(withID: Constants.kGidId)
        Switcher.updateRootVC()
        return true
    }
    
    @available(iOS 9.0, *)
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
        return googleService.handle(url: url)
        
    }
}


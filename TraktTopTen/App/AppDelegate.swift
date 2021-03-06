//
//  AppDelegate.swift
//  TraktTopTen
//
//  Created by Paul Williamson on 04/04/2015.
//  Copyright (c) 2015 Paul Williamson. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        let navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.tintColor = UIColor.applicationWhiteColour()
        navigationBarAppearace.barTintColor = UIColor.applicationMainThemeColor()
        navigationBarAppearace.translucent = false
        let attributes = [NSForegroundColorAttributeName: UIColor.applicationWhiteColour(),
            NSFontAttributeName: UIFont.applicationNavigatorBarFont()]
        navigationBarAppearace.titleTextAttributes = attributes
        
        return true
    }

}


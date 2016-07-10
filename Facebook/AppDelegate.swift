//
//  AppDelegate.swift
//  Facebook
//
//  Created by Joshua Bell on 7/10/16.
//  Copyright © 2016 Joshua Bell. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didRegisterUserNotificationSettings notificationSettings: UIUserNotificationSettings) {
        application.applicationIconBadgeNumber = 12839
        self.launchFacebookApp( application )
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        self.launchFacebookApp( application )
    }
    
    func launchFacebookApp( application: UIApplication ) {
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(0.02 * Double(NSEC_PER_SEC)))
        dispatch_after( delayTime, dispatch_get_main_queue()) {
            let uberAppURL = NSURL.init( string:"fb://")
            if application.canOpenURL(uberAppURL!) {
                application.openURL(uberAppURL!)
            } else {
                let uberWebURL = NSURL.init( string:"https://www.facebook.com")
                application.openURL( uberWebURL! )
            }
        }
    }
}


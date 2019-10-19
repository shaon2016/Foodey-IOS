//
//  AppDelegate.swift
//  The Foodey
//
//  Created by MacBook Pro  on 18/9/19.
//  Copyright © 2019 LastBlade. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as String)
        
        setRootVC()
        return true
    }
    
    
    func setRootVC()
    {
        if MyUserDefault().isLoggedIn() {
            updateNavigationBarAppearance()
            
            let vc = UIStoryboard.storyboard(storyboard: .Nav, bundle: nil).instantiateViewController(withIdentifier: "navVC")
            
//            let navigationController = UINavigationController(rootViewController: vc)
//
            window?.rootViewController = vc
            
            //window?.makeKeyAndVisible()
        } else {
            let nav = UIStoryboard.storyboard(storyboard: .Auth, bundle: nil).instantiateViewController(withIdentifier: "loginVC")
            
            window?.rootViewController = nav
        }
    }
    
    func updateNavigationBarAppearance(){
        UINavigationBar.appearance().barTintColor = UIColor.red
        // Change the bar item color or bar item text color
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
//        UITabBar.appearance().tintColor = UIColor.white
//        UITabBar.appearance().barTintColor = UIColor.lightGray
        
    }
   
}


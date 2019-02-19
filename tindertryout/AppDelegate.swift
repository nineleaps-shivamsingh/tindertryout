//
//  AppDelegate.swift
//  tindertryout
//
//  Created by Nineleaps on 09/02/19.
//  Copyright © 2019 Nineleaps. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import Foundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // try out the session maintainence
        //        // Access the storyboard and fetch an instance of the view controller
//                let storyboard = UIStoryboard(name: "Main", bundle: nil);
//                let LoginviewController: ViewController = storyboard.instantiateViewController(withIdentifier: "LoginScreen") as! ViewController;
//                    let HomeviewController: PoiViewController = storyboard.instantiateViewController(withIdentifier: "HomeScreen") as! PoiViewController;
//
//                 let rootViewController = self.window!.rootViewController as! UINavigationController
//                if let _: String = KeychainWrapper.standard.string(forKey: "auth_token") {
//
//
//                        rootViewController.pushViewController(HomeviewController, animated: true)
//
//                }
//
//                else{
//                    // Then push that view controller onto the navigation stack
//              //  let rootViewController = self.window!.rootViewController as! UINavigationController;
//         rootViewController.pushViewController(LoginviewController, animated: true);
//               }
//
////        // Access the storyboard and fetch an instance of the view controller
////        let storyboard = UIStoryboard(name: "Main", bundle: nil);
////        let viewController: MainViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! MainViewController;
////
////        // Then push that view controller onto the navigation stack
////        let rootViewController = self.window!.rootViewController as! UINavigationController;
////        rootViewController.pushViewController(viewController, animated: true);
        
//        if let _: String = KeychainWrapper.standard.string(forKey: "auth_token") {
//
//        self.window?.rootViewController!.performSegue(withIdentifier: "homeScreen", sender: nil)
//        }
//
//        else{
//
//             self.window?.rootViewController!.performSegue(withIdentifier: "loginScreen", sender: nil)
//
//        }
        
        
//        window = UIWindow(frame: UIScreen.main.bounds)
//        window?.makeKeyAndVisible()
//        
//        window?.rootViewController = MainNavigationController()
//        
//
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
       
        // swiftlint:disable force_cast
        
        if let key: String = KeychainWrapper.standard.string(forKey: "auth_token") {
        
            print(key)
            let homeviewController: PoiViewController = storyboard.instantiateViewController(withIdentifier: "HomeScreen") as! PoiViewController;
            window = UIWindow()
            window?.rootViewController = homeviewController
            window?.makeKeyAndVisible()
        }
        else
        {
            let loginviewController: ViewController = storyboard.instantiateViewController(withIdentifier: "LoginScreen") as! ViewController;
            window = UIWindow()
            window?.rootViewController = loginviewController
            window?.makeKeyAndVisible()
            
        }
     
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state.
        //This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message)
        //or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store
        //enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}

//
//  AppDelegate.swift
//  Pokedex
//
//  Created by Tuba Nur on 10.10.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if #available(iOS 15, *) {
                   let appearance = UINavigationBarAppearance()
                   appearance.configureWithTransparentBackground()
                   UINavigationBar.appearance().standardAppearance = appearance
                   UINavigationBar.appearance().scrollEdgeAppearance = appearance
                   appearance.backgroundColor  = #colorLiteral(red: 0.9411764706, green: 0.4705882353, blue: 0.3921568627, alpha: 1)
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}


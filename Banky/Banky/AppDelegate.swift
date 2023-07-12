//
//  AppDelegate.swift
//  Banky
//
//  Created by Adam Roden on 11/07/2023.
//

import UIKit 

@main
class AppDelegate: UIResponder, UIApplicationDelegate
{
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?)
    -> Bool
    {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
        //window?.rootViewController = LoginViewController()
        window?.rootViewController = OnboardingContainerViewController()
        return true
    }


}


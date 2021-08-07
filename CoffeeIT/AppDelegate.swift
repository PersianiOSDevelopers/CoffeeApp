//
//  AppDelegate.swift
//  CoffeeIT
//
//  Created by Amir Tutunchi on 8/7/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: MainCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navController = UINavigationController.init()
        navController.isNavigationBarHidden = true
        coordinator = MainCoordinator.init(navigationController: navController)
        coordinator?.start()
        
        // create a basic uiwindow and activate it here
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        return true
    }



}


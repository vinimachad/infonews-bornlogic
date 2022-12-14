//
//  AppDelegate.swift
//  InfoNews
//
//  Created by Vinicius Galhardo Machado on 08/09/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    private var appCoordinator: AppCoordinator?
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        self.appCoordinator = AppCoordinator(window: window)
        appCoordinator?.start()
        
        return true
    }
}


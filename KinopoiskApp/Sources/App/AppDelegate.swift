//
//  AppDelegate.swift
//  KinopoiskApp
//
//  Created by Анна Лошакова on 15.10.2022.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        let tabBarController = UITabBarController()
        tabBarController.tabBar.tintColor = .orange
        
        let viewController = SearchViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        viewController.tabBarItem = UITabBarItem(title: "Поиск",
                                                 image: UIImage(systemName: "magnifyingglass"),
                                                 tag: 0)
        
        tabBarController.setViewControllers([navigationController], animated: true)
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }
}


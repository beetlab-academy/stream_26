//
//  AppDelegate.swift
//  Flickr
//
//  Created by Андрей Коноплев on 12.12.2020.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let appAssembly = AppAssembly()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let tapeVC = appAssembly.tapeViewController()
        let navigationController = UINavigationController()
        navigationController.pushViewController(tapeVC, animated: true)
        
        window?.rootViewController = navigationController
        
        return true
    }

}


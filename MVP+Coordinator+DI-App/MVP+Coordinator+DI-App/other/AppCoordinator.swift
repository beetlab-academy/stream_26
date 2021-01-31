//
//  AppCoordinator.swift
//  MVP+Coordinator+DI-App
//
//  Created by Андрей Коноплев on 31.01.2021.
//

import UIKit


class AppCoordinator {
    
    let window: UIWindow
    let tabBarController = UITabBarController()
    
    private let tapeAssembly = TapeAssembly.instance()
    
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        window.rootViewController = tabBarController
        
        let tapeCoordinator = tapeAssembly.coordinator(output: self)
        tapeCoordinator.start(tabBarController: tabBarController)
    }
    
}


extension AppCoordinator: TapeModuleOutput {
    
}

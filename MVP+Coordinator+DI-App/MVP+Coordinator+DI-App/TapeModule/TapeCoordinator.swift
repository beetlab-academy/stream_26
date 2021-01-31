//
//  TapeCoordinator.swift
//  MVP+Coordinator+DI-App
//
//  Created by Андрей Коноплев on 31.01.2021.
//

import UIKit

protocol TapeCoordinatorProtocol: class {
    func showDetailedViewController(id: String) -> Void
}

class TapeCoordinator {
    
    let navigationController: UINavigationController
    
    var output: TapeModuleOutput! //inject
    var assembly: TapeAssembly! //inject
    
    init(navController: UINavigationController) {
        self.navigationController = navController
    }
    
    func start(tabBarController: UITabBarController) {
        let vc = assembly.tapeViewController(coordinator: self)
        navigationController.pushViewController(vc, animated: false)
        navigationController.tabBarItem = UITabBarItem(title: "Лента", image: nil, tag: 0)
        
        if tabBarController.viewControllers == nil {
            tabBarController.viewControllers = [navigationController]
        } else {
            tabBarController.viewControllers?.append(navigationController)
        }
    }
    
}

extension TapeCoordinator: TapeCoordinatorProtocol {
    func showDetailedViewController(id: String) {
        let vc = assembly.detailedViewController(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
}

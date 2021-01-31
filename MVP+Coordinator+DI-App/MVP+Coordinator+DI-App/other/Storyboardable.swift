//
//  Storyboardable.swift
//  MVP+Coordinator+DI-App
//
//  Created by Андрей Коноплев on 31.01.2021.
//

import UIKit

protocol Storyboardable {
    static func storyboardName() -> String
}


extension Storyboardable where Self: UIViewController {
    
    static func create() -> Self {
        let storyboard = self.storyboard()
        
        let className = NSStringFromClass(Self.self)
        let finalClassName = className.components(separatedBy: ".").last!
        let viewControllerId = finalClassName + "ID"
        let viewController = storyboard.instantiateViewController(withIdentifier: viewControllerId)
        return viewController as! Self
    }
    
    static func storyboard() -> UIStoryboard {
        return UIStoryboard(name: storyboardName(), bundle: nil)
    }
    
}

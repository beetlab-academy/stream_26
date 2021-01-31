//
//  DetailedViewController.swift
//  MVP+Coordinator+DI-App
//
//  Created by Андрей Коноплев on 31.01.2021.
//

import UIKit

protocol DetailedViewProtocol: class {
    
}

class DetailedViewController: UIViewController, DetailedViewProtocol {
    
    var presenter: DetailedPresenterProtocol! //inject

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue
    }
    

}

extension DetailedViewController: Storyboardable {
    static func storyboardName() -> String {
        return "Tape"
    }
}

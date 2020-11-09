//
//  ViewController.swift
//  DrinkUp
//
//  Created by Andrei Konoplev on 07.11.2020.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet  weak var backgroindImageView: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    fileprivate func setupLayout() {
        view.backgroundColor = UIColor.green
        navigationItem.title = "Drink up"
        backgroindImageView.contentMode = .scaleAspectFill
    }
    
    
    deinit {
        print("deinit \(self.self)")
    }

    
}


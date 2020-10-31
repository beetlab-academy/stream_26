//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by Андрей Коноплев on 31.10.2020.
//  Copyright © 2020 Андрей Коноплев. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var plusMinusButton: UIButton!
    
    
    fileprivate var buttons: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupLayers()
    }
    
    fileprivate func setupLayout() {
        view.backgroundColor = UIColor.black
        
        clearButton.clipsToBounds = true
    }
    
    func setupLayers() { //Вот тут вот сетапим корнер радиусы
        buttons = [clearButton, plusMinusButton]
        buttons.forEach { (button) in
            button.layer.cornerRadius = (button.frame.width / 2)
        }
    }

}

//
//  FirstViewController.swift
//  Calculator
//
//  Created by Андрей Коноплев on 31.10.2020.
//  Copyright © 2020 Андрей Коноплев. All rights reserved.
//

import UIKit //Framework

class FirstViewController: UIViewController {

    @IBOutlet weak var incrimentButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    
    fileprivate var counter: Int = 0
    
    override func viewDidLoad() { //Вызвыается когда view загрузилась, и тут мы должны сетапить наш лейаут
        super.viewDidLoad()
        setupLayout()
    }
    
    @IBAction func buttonDidTap(_ sender: Any) {
        increment()
        countLabel.text = "\(counter)"
    }
    
    fileprivate func setupLayout() {
       // view.backgroundColor = UIColor.red
        
        incrimentButton.layer.cornerRadius = 10
        incrimentButton.clipsToBounds = true
        incrimentButton.setTitle("UP", for: .normal)
        
        countLabel.text = "Пока что ничего не нажато было"
    }
    
    func increment() -> Void {
        counter += 1
    }

}

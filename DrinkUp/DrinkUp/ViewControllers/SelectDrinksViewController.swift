//
//  SelectDrinksViewController.swift
//  DrinkUp
//
//  Created by Andrei Konoplev on 07.11.2020.
//

import UIKit

class SelectDrinksViewController: UIViewController {
    
    fileprivate var gender: UserGender?
    fileprivate var weight: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func setUserGenderAndWeight(gender: UserGender, weight: Int) {
        self.gender = gender
        self.weight = weight
        print(self.gender)
        print(self.weight)
    }
    

}

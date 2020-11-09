//
//  AgeAndSexViewController.swift
//  DrinkUp
//
//  Created by Andrei Konoplev on 07.11.2020.
//

import UIKit

enum UserGender: Int {
    case male = 0
    case female = 1
}

class WeightAndSexViewController: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var femaleButton: UIButton!
    @IBOutlet weak var nextButton: StartButton!
    
    fileprivate var gender: UserGender? {
        didSet {
            updateNextButtonEnable()
        }
    }
    fileprivate var weight: Int = 0 {
        didSet { // почитать про didSet
            updateNextButtonEnable()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        nextButton.isEnabled = false
        
    }
    
    fileprivate func setupLayout() {
        navigationItem.title = "Пол и возраст"
        backgroundImage.contentMode = .scaleAspectFill
        
            //textFirld
        textField.placeholder = "Введите свой вес"
        textField.textAlignment = .center
        textField.delegate = self
        textField.keyboardType = .numberPad
    }
    
    fileprivate func updateNextButtonEnable() {
        if self.gender != nil && self.weight > 0 {
            nextButton.isEnabled = true
        } else {
            nextButton.isEnabled = false
        }
    }
    
    
    @IBAction func sexButtonDidTap(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        self.gender = UserGender(rawValue: button.tag)
    }
    
    @IBAction func nextButtonDidTap(_ sender: Any) {
        
        self.weight = Int(textField.text!) ?? 0
        
        guard self.gender != nil, self.weight > 0 else { return }
        
        self.performSegue(withIdentifier: "goToSelectDrinks", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "goToSelectDrinks", let destinationVC = segue.destination as? SelectDrinksViewController {
            guard let userGender = self.gender, self.weight > 0 else { return }
            destinationVC.setUserGenderAndWeight(gender: userGender, weight: weight)
        }
    }
    
}

extension WeightAndSexViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder() //Поднять клавиатуру
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(textField.text)
        print(string)
        //Каждый раз нужно присваивать weight c новой строкой! textField.text не выводит адекватные данные
        
        return true
    }
}

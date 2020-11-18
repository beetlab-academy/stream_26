import UIKit

//MARK: - Паттерн делегирование.

protocol Delegate: class {
    func manageRussia() -> Void
}

class Russians {
    
    weak var delegate: Delegate?
    
    func elections() {
        print("Выбираем президента")
        delegate?.manageRussia()
    }
    
}


class President: Delegate {
    
    func manageCountry() {
        print("Упрвляю страной")
    }
    
    func manageRussia() {
        manageCountry()
    }
}


let russians = Russians()
let president = President()

russians.delegate = president

russians.elections()
russians.elections()


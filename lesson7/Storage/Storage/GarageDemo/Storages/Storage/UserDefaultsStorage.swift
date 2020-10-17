//
//  UserDefaultsStorage.swift
//  Storage
//
//  Created by Andrei Konoplev on 17.10.2020.
//

import Foundation

class UserDefaultsStorage: Storage {
    
    let defaults = UserDefaults.standard
    
    func put(object: Any, forKey: String) {
        defaults.setValue(object, forKey: forKey)
    }
    
    func get(forKey: String) -> Any? {
        defaults.object(forKey: forKey)
    }
}

//
//  InMemoryStorage.swift
//  Storage
//
//  Created by Andrei Konoplev on 17.10.2020.
//

import Foundation

class InMemStorage: Storage {
    
    var dict: [String: Any] = [:]
    
    func put(object: Any, forKey: String) {
        dict[forKey] = object
    }
    
    func get(forKey: String) -> Any? {
        return dict[forKey]
    }
}

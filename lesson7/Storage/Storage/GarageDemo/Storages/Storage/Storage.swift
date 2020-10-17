//
//  Storage.swift
//  Storage
//
//  Created by Andrei Konoplev on 17.10.2020.
//

import Foundation

protocol Storage {
    func put(object: Any, forKey: String)
    func get(forKey: String) -> Any?
}

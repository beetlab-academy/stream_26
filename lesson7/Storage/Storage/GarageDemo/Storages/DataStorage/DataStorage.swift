//
//  DataStorage.swift
//  Storage
//
//  Created by Andrei Konoplev on 17.10.2020.
//

import Foundation

typealias DataStorageKey = String
 
protocol DataStorage {
    func put(data: Data, for: DataStorageKey) // Положить данные в базу данных
    func get(for: DataStorageKey) -> Data?  //Забрать данные из базы данных
}

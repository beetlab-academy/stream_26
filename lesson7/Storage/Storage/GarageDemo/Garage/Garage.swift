//
//  Garage.swift
//  Storage
//
//  Created by Andrei Konoplev on 17.10.2020.
//

import Foundation

//

let cacheKey = "CACHE_KEY"

struct Floor: Codable {
    var cars: [Car]
}

struct Slot: Codable {
    var floor: Floor
}

struct Ticket: Codable {
    var slot: Slot
}

struct Car: Codable { }

class Garage {
    
    //Storage для того чтобы хранить все данные в памяти
    var storage: DataStorage!
    var floors: [Floor] = []
    
    func generate() {
        //Функция генерит случайное число обьектов Floor и в переменную floors записывает массив этажей. Только если массив пустой
    }
    
    func park(with car: Car) -> Ticket? {
        setFloors(floors: floors)
        return nil
    }
    
    func unpark(with ticket: Ticket) -> Car? {
        setFloors(floors: floors)
        return nil
    }
    
    func getFloors() -> [Floor] {
        guard let data = storage.get(for: cacheKey) else {
            print("По ключу \(cacheKey) данных не обнаружено")
            return []
        }
        
        do {
            let floors: [Floor] = try JSONDecoder().decode([Floor].self, from: data) // Декодируем модели из нашей data полученной с жесткого диска по ключу cachKey
            return floors //возвращаем уже модели
        } catch {
            print("Не получилось декодировать обьект полученный из памяти типа Data в наши модели")
            return []
        }
    }
    
    func setFloors(floors: [Floor]) {
        do {
            let data: Data = try JSONEncoder().encode(floors) // Кодируем наши модели в тип Data, потому что нельзя сохранить модели на жесткий диск!
            storage.put(data: data, for: cacheKey) //Сохраняем наши данные в память телефона
        } catch {
            print("Ошибка, у нас не получилось записать данные в память телефона \(error)")
        }
    }
}

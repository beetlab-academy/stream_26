import UIKit

protocol Guests {
    func houseWithGuests() -> Void
}

class House {
    let adress: String
    let gateCount: Int
    let nameHouse: String
    let roofGarden: Bool
    
    
    init(adress: String, gateCount: Int, nameHouse: String, roofGarden: Bool) {
        self.adress = adress
        self.gateCount = gateCount
        self.nameHouse = nameHouse
        self.roofGarden = roofGarden
    }
    func fullAdressWithFloor() -> String {
        return "Дома по \(self.adress) с количеством этажей - \(self.gateCount)"
    }
}

class Flat: House {
    func getAdress() -> String {
        return self.adress
    }
}
class Room: Flat, Guests {
    var guests: Int? = 5
    
    func houseWithGuests() {
        if guests != nil {
            print("House with guests")
        } else {
            print("House without guests")
        }
    }
}

let house = House(adress: "sdfsdaf", gateCount: 1234, nameHouse: "dsfsd", roofGarden: true)
let flat = Flat(adress: "dsf", gateCount: 23, nameHouse: "flat", roofGarden: false)
let room = Room(adress: "Room", gateCount: 3, nameHouse: "ds", roofGarden: true)

var array: [House] = []
array.append(house)
array.append(flat)
array.append(room)

print(array)

for elemnt in array {
    
    if let gests = elemnt as? Guests {
        gests.houseWithGuests()
    }
    
    if let flat = elemnt as? Flat {
       print("flat`s adress is \(flat.getAdress())")
    }
    
}





// 2. не успел решить задачу, тн осталась в первозданном виде



class Master {
    let proffesion: String
    let name: String
    
    init(proffesion:String, name: String) {
        self.name = name
        self.proffesion = proffesion
    }
}

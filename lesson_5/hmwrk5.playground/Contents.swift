import UIKit

//1.Создать структуру Rectangle с 2 свойствами - длина и ширина. Написать методы вычисления периметра и площади

struct Rectangle {
    
    let width: Int
    let height: Int

    func perimetr() -> Int {
        let area = self.width * self.height
        return area
    }
    
    func area() -> Int {
        let perimeter = (self.width + self.height) * 2
        return perimeter
    }
    
}
let obj = Rectangle (width: 200, height: 228)

let peruimetr = obj.perimetr()
let area = obj.area()



//let funcDone1 = dlinaShirina()
//print(funcDone1)

//2.Создать структуру Circle с 1 свойством - радиус. Написать функцию, принимающую на вход объект Circle и вычисляющую площадь окружности.

struct Circle {
    let radius: Double
    func areaCircle() -> String {
        let area1 = (self.radius * self.radius) * Double.pi
        return "Площадь окружности равноа \(area1)"
    }
}



let obj1 = Circle (radius: 4)
print(obj1.areaCircle())

//3.Создать структуру Human с 2 свойствами - имя и возраст. Создать массив из 20 людей. Написать функцию, принимающую на вход этот массив и печатающую имена людей.

struct Human {
   let name: String
   let age: Int
}

var humanArray = [Human(name: "Денис", age: 25), Human(name: "Vladislav", age: 25), Human(name: "Andrei", age: 26), Human(name: "dima", age: 25),
                  Human(name: "Vladislav", age: 25), Human(name: "Veta", age: 29), Human(name: "adolf", age: 1488), Human(name: "petya", age: 21),
                  Human(name: "sasha", age: 25), Human(name: "vova", age: 73), Human(name: "slava", age: 456565), Human(name: "vitya", age: 44)]

func independedSquad(human: [Human]) {
    for element in humanArray {
        print(element.name)
    }
    
    let arrayName = human.map { (human) -> Int in
        return human.age
    }
    
    print(arrayName.max())
}

independedSquad(human: humanArray)


//4.Написать функцию, печатающую имя самого старшего человека из п.3

func mostOldHuman(x: [Human]) -> String {
    var human: String = ""
    var xArray = [Int]()
    for element in humanArray {
        xArray.append(element.age)
    }
    for element in humanArray {
        if element.age == xArray.max() {
            human = element.name
        }
    }
   return human
}
let obj2 = mostOldHuman(x: humanArray)
print(obj2)


// На вход функции 2 массива. Первый - имена [“Петя”, “Гриша”, “Никола”]. Второй - соответствующие времена пробежки дистанции. [10, 6, 25] (Петя - за 10 минут, Гриша - 6 минут, Никола - 25 минут) . Написать функцию, возвращающую самого медленного и самого быстрого.

//НЕ ВЫПОЛНИЛ
//var nameArray: [String] = ["Петя", "Гриша", "Никола"]
//var timeArray: [Int] = [10, 6, 25]
//
//struct Sport  {
//    let name: String
//    let time: Int
//}
//    func mainArray (nameArray: [String], timeArray: [Int]) -> [String: Int] {
//        var human: Sport
//        for element in nameArray {
//            human.name = nameArray.element
//        }
//        for index in timeArray {
//            human.time = timeArray[index]
//        }
//        return human
//    }
//
//    func fastSlow (human: [Sport]) -> String {
//        let fast: String
//        if human.time == human.max() {
//             fast = human.name
//        }
//        return fast
//    }



struct Sportman {
    let name: String
    let time: Int
}

var arrayOfPersons = [Sportman(name: "Ronaldo", time: 10), Sportman(name: "Messi", time: 6), Sportman(name: "Beckham", time: 25)]

func getFastesAndSlowlest(with array: [Sportman]) -> (Sportman?, Sportman?) {
    var fastest: Sportman?
    var slowest: Sportman?
    
    let times = array.map { (obj) -> Int in
        return obj.time
    }
    
    for element in array {
        if element.time == times.max() {
            fastest = element
        } else if element.time == times.min() {
            slowest = element
        }
    }

    if array.count == 0 {
        return (nil, nil)
    }
    
    return (fastest, slowest)
}






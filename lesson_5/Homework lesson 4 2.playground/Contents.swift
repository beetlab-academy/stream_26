import UIKit

// задача номер девять из прошлой домашней работы
// задача номер девять
// условие задачи: на вход функции 2 массива. Первый - имена [“Ronaldo”, “Messi”, “Beckham”]. Второй - соответствующие времена пробежки дистанции. [10, 6, 25] (Ronaldo - за 10 минут, Messi - 6 минут, Beckham - 25 минут) . Написать функцию, возвращающую самого медленного и самого быстрого.

func theBestAndTheWorst(name:[String], speed:[Int]) -> [String] {
    
    var someArray = [String]()
    
    for index in 0...speed.count - 1 {
        if speed[index] == speed.min() {
            someArray.append("Самый быстрый - \(name[index])")
        } else if speed[index] == speed.max() {
            someArray.append("Самый медленный - \(name[index])")
        }
    }

    return someArray
}

let resulTtheBestAndTheWorst = theBestAndTheWorst(name: ["Ronaldo", "Messi", "Beckham"], speed: [10, 6, 25])
print(resulTtheBestAndTheWorst)

// задача номер один
// условие задачи: создать структуру Rectangle с 2 свойствами - длина и ширина. Написать методы вычисления периметра и площади.

struct Rectangle {
    let length: Int
    let width: Int
    
    func square() -> String {
        let squareOfRectangle = length * width
        return("Площадь прямоугольника равна \(squareOfRectangle)")
    }
    
    func perimeter() -> String {
        let perimeterOfRectangle = 2 * (length + width)
        return("Периметр прямоугольника равна \(perimeterOfRectangle)")
    }
}

let someRectangle = Rectangle(length: 5, width: 4) // почему не может быть let?
print(someRectangle.square())
print(someRectangle.perimeter())

// задача номер два
// условие задачи: создать структуру Circle с 1 свойством - радиус. Написать функцию, принимающую на вход объект Circle и вычисляющую площадь окружности.

struct Circle {
    var radius: Double
}

func squareOfCircle(circle: Circle) -> String {
  
    let square = Double.pi * (circle.radius * circle.radius)
    return("Площадь окружности равна \(square)")
}

let resultSquareOfСircle = squareOfCircle(circle: Circle.init(radius: 6))
print(resultSquareOfСircle)
    
// задача номер три
// условие задачи: создать структуру Human с 2 свойствами - имя и возраст. Создать массив из 20 людей. Написать функцию, принимающую на вход этот массив и печатающую имена людей.

struct Human {
    var name: String
    var age: Int
}

var arrayOfPeople = [Human(name: "Wayne", age: 34), Human(name: "Lionel", age: 33), Human(name: "David", age: 45), Human(name: "Marcus", age: 22), Human(name: "Antony", age: 24), Human(name: "Sadio", age: 29), Human(name: "Harry", age: 31), Human(name: "Aaron", age: 23), Human(name: "Paul", age: 38), Human(name: "Idion", age: 41)]

func printTheNames(x: [Human]) -> [String] {
    var someArray = [String]()
    
    for element in arrayOfPeople {
        someArray.append(element.name)
    }
    return someArray
}

let resultPrintTheNames = printTheNames(x: arrayOfPeople)
print(resultPrintTheNames)


// задача номер  четыре
// условие задачи: написать функцию, печатающую имя самого старшего человека из п.3

func printTheOldestMan(x: [Human]) {
    var maxAge = [Int]() // можно ли из свойства структуры вытянуть max значение?
    
    for element in arrayOfPeople {
        maxAge.append(element.age)
    }
    
    for element in arrayOfPeople {
        if element.age == maxAge.max() {
            print(element.name)
        } 
    }

}

printTheOldestMan(x: arrayOfPeople)


// задача номер пять
// решить задачу из предыдущей домашки с помощью структур.
// условие задачи: на вход функции 2 массива. Первый - имена [“Ronaldo”, “Messi”, “Beckham”]. Второй - соответствующие времена пробежки дистанции. [10, 6, 25] (Ronaldo - за 10 минут, Messi - 6 минут, Beckham - 25 минут) . Написать функцию, возвращающую самого медленного и самого быстрого.

struct Sportman {
    var name: String
    var speed: Int
}

var arrayOfPersons = [Sportman(name: "Ronaldo", speed: 10), Sportman(name: "Messi", speed: 6), Sportman(name: "Beckham", speed: 25)]

func theBestAndTheWorst(x: [Sportman]) -> [String] {
    var arrayOfName = [String]()
    var powerOfSpeed = [Int]()
    
    for element in arrayOfPersons {
        powerOfSpeed.append(element.speed)
    }
    
    for element in arrayOfPersons {
        if element.speed == powerOfSpeed.min() {
            arrayOfName.append("Самый быстрый - \(element.name)")
        }
    }
    
    for element in arrayOfPersons {
        if element.speed == powerOfSpeed.max() {
            arrayOfName.append("Самый медленный - \(element.name)")
        }
    }
    return arrayOfName
}

let resultTheBestAndTheWorst = theBestAndTheWorst(x: arrayOfPersons)
print(resultTheBestAndTheWorst)

// задача номер шесть
// условие задачи: написать класс, который описывает свойства человека. Методы должны выпонять действия похожие на то, что делает человек в обычной жизни.

enum Complexion {
    case white
    case tanned // загорелый
    case yellow
    case black
}

enum Relationship {
    case free
    case hasRelationship
    case fianceOrFiancee
    case husbandOrWife
}

class DiscriptionPerson {
    var age: Int
    var hairLength: String
    var weight: Int
    var complexion: Complexion // цвет лица светлый
    var relationship: Relationship // cтатус отношений
    
    init(age: Int, hairLength: String, weight: Int, complexion: Complexion, relationship: Relationship) {
        self.age = age
        self.hairLength = hairLength
        self.weight = weight
        self.complexion = complexion
        self.relationship = relationship
    }
    
    func HappyBirthday() {
        age = age + 1
    }
    
    func hairLengthier() {
        hairLength = "Become longer"
    }
    
    func hairShorter() {
        hairLength = "Become shorter"
    }
    
    func weightIncrease () {
        weight = weight + 5
    }
    
    func weightLoss() {
        weight = weight - 5
    }
    
    func makeProposal() -> Bool {
        if relationship == Relationship.free {
            return true
        } else {
            return false
        }
    }
}


var anna = DiscriptionPerson(age: 25, hairLength: "Middle", weight: 50, complexion: .tanned, relationship: .husbandOrWife)

anna.HappyBirthday()
anna.hairLengthier()
anna.hairShorter()
anna.weightIncrease()
anna.weightLoss()
anna.weightLoss()
anna.makeProposal()




